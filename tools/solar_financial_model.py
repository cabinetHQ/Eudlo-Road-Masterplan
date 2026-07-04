from __future__ import annotations

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
ASSUMPTIONS_PATH = ROOT / "data" / "assumptions.json"
OUTPUT_PATH = (
    ROOT
    / "docs"
    / "02_Investment_Financial_Strategy"
    / "Financial_Model_Output.md"
)


BILL_OFFSET_SCENARIOS = [0.70, 0.80, 0.90, 0.95]
PROJECT_COSTS = [60000, 70000, 80000, 100000]
ELECTRICITY_GROWTH_RATES = [0.00, 0.03, 0.05, 0.07]
OFFSET_ACCOUNT_RATES = [0.05, 0.06, 0.07]
FINANCE_RATES = [0.00, 0.03, 0.06, 0.08]
FINANCE_TERMS = [5, 7, 10]

MAINTENANCE_ALLOWANCE_ANNUAL = 0
BATTERY_REPLACEMENT_ALLOWANCE_YEAR = None
BATTERY_REPLACEMENT_ALLOWANCE_COST = 0
BASE_BILL_OFFSET = 0.80


def aud(value: float) -> str:
    return f"${value:,.0f}"


def pct(value: float) -> str:
    return f"{value:.0%}"


def years(value: float) -> str:
    return f"{value:.1f} years"


def markdown_table(headers: list[str], rows: list[list[str]]) -> str:
    lines = [
        "| " + " | ".join(headers) + " |",
        "| " + " | ".join("---" for _ in headers) + " |",
    ]
    for row in rows:
        lines.append("| " + " | ".join(row) + " |")
    return "\n".join(lines)


def annual_payment(principal: float, annual_rate: float, term_years: int) -> float:
    if annual_rate == 0:
        return principal / term_years
    return principal * annual_rate / (1 - (1 + annual_rate) ** -term_years)


def annual_saving(annual_bill: float, bill_offset: float, year: int, growth_rate: float) -> float:
    grown_bill = annual_bill * ((1 + growth_rate) ** (year - 1))
    return grown_bill * bill_offset


def cumulative_savings(
    annual_bill: float,
    bill_offset: float,
    years_count: int,
    growth_rate: float,
    maintenance_annual: float = MAINTENANCE_ALLOWANCE_ANNUAL,
) -> float:
    return sum(
        annual_saving(annual_bill, bill_offset, year, growth_rate) - maintenance_annual
        for year in range(1, years_count + 1)
    )


def npv_placeholder(
    initial_cost: float,
    annual_cash_flows: list[float],
    discount_rate: float,
) -> float | None:
    """Placeholder for later accountant-reviewed NPV logic."""
    return None


def irr_placeholder(initial_cost: float, annual_cash_flows: list[float]) -> float | None:
    """Placeholder for later accountant-reviewed IRR logic."""
    return None


def build_output() -> str:
    assumptions = json.loads(ASSUMPTIONS_PATH.read_text(encoding="utf-8"))
    annual_bill = assumptions["current_power_bill_annual"]
    monthly_bill = assumptions["current_power_bill_monthly"]
    daily_kwh = assumptions["average_daily_consumption_kwh"]

    baseline_rows = [
        ["Current monthly power bill", aud(monthly_bill)],
        ["Current annual power bill", aud(annual_bill)],
        ["Average daily consumption", f"{daily_kwh} kWh/day"],
        ["Stage 1 solar", f'{assumptions["stage_1_solar_kw"]} kW'],
        ["Stage 1 battery", f'{assumptions["stage_1_battery_kwh"]} kWh'],
        ["Future solar design target", f'{assumptions["future_solar_kw"]} kW'],
        ["Maintenance allowance", aud(MAINTENANCE_ALLOWANCE_ANNUAL) + " per year placeholder"],
        [
            "Battery replacement allowance",
            "TBD"
            if BATTERY_REPLACEMENT_ALLOWANCE_YEAR is None
            else f"Year {BATTERY_REPLACEMENT_ALLOWANCE_YEAR}: {aud(BATTERY_REPLACEMENT_ALLOWANCE_COST)}",
        ],
    ]

    annual_savings_rows = []
    savings_by_offset = {}
    for bill_offset in BILL_OFFSET_SCENARIOS:
        saving = annual_bill * bill_offset
        savings_by_offset[bill_offset] = saving
        annual_savings_rows.append(
            [pct(bill_offset), aud(saving), aud(annual_bill - saving)]
        )

    payback_rows = []
    for cost in PROJECT_COSTS:
        payback_rows.append(
            [aud(cost)]
            + [years(cost / savings_by_offset[offset]) for offset in BILL_OFFSET_SCENARIOS]
        )

    cumulative_rows = []
    for bill_offset in BILL_OFFSET_SCENARIOS:
        cumulative_rows.append(
            [
                pct(bill_offset),
                aud(cumulative_savings(annual_bill, bill_offset, 10, 0.00)),
                aud(cumulative_savings(annual_bill, bill_offset, 15, 0.00)),
                aud(cumulative_savings(annual_bill, bill_offset, 10, 0.03)),
                aud(cumulative_savings(annual_bill, bill_offset, 15, 0.03)),
            ]
        )

    growth_rows = []
    for growth_rate in ELECTRICITY_GROWTH_RATES:
        growth_rows.append(
            [
                pct(growth_rate),
                aud(cumulative_savings(annual_bill, BASE_BILL_OFFSET, 10, growth_rate)),
                aud(cumulative_savings(annual_bill, BASE_BILL_OFFSET, 15, growth_rate)),
            ]
        )

    offset_rows = []
    base_saving = savings_by_offset[BASE_BILL_OFFSET]
    for cost in PROJECT_COSTS:
        row = [aud(cost)]
        for offset_rate in OFFSET_ACCOUNT_RATES:
            opportunity_cost = cost * offset_rate
            row.append(aud(opportunity_cost))
            row.append(aud(base_saving - opportunity_cost))
        offset_rows.append(row)

    finance_rows = []
    for cost in PROJECT_COSTS:
        for rate in FINANCE_RATES:
            row = [aud(cost), pct(rate)]
            for term in FINANCE_TERMS:
                payment = annual_payment(cost, rate, term)
                row.append(aud(payment))
                row.append(aud(base_saving - payment))
            finance_rows.append(row)

    break_even_rows = []
    for cost in PROJECT_COSTS:
        break_even_rows.append(
            [
                aud(cost),
                aud(cost / 5),
                aud(cost / 7),
                aud(cost / 10),
                aud(cost / 15),
            ]
        )

    npv_value = npv_placeholder(-PROJECT_COSTS[1], [base_saving] * 10, 0.06)
    irr_value = irr_placeholder(-PROJECT_COSTS[1], [base_saving] * 10)

    return "\n\n".join(
        [
            "# Financial Model Output",
            "Generated by `tools/solar_financial_model.py`.",
            "## Baseline",
            markdown_table(["Metric", "Value"], baseline_rows),
            "## Annual Savings By Bill Offset",
            markdown_table(
                ["Bill offset", "Annual saving", "Residual annual bill"],
                annual_savings_rows,
            ),
            "## Simple Payback",
            markdown_table(
                ["Project cost", "70% offset", "80% offset", "90% offset", "95% offset"],
                payback_rows,
            ),
            "## 10-Year And 15-Year Cumulative Savings",
            markdown_table(
                [
                    "Bill offset",
                    "10 years at 0% growth",
                    "15 years at 0% growth",
                    "10 years at 3% growth",
                    "15 years at 3% growth",
                ],
                cumulative_rows,
            ),
            "## Electricity Price Growth Sensitivity",
            "Uses the 80% bill offset scenario as the base case.",
            markdown_table(
                ["Electricity price growth", "10-year cumulative saving", "15-year cumulative saving"],
                growth_rows,
            ),
            "## Offset Account Comparison",
            "Uses the 80% bill offset scenario. Net benefit means annual solar saving minus the offset return given up by using cash.",
            markdown_table(
                [
                    "Cash used",
                    "5% offset cost",
                    "Net at 5%",
                    "6% offset cost",
                    "Net at 6%",
                    "7% offset cost",
                    "Net at 7%",
                ],
                offset_rows,
            ),
            "## Financed Purchase Model",
            "Uses the 80% bill offset scenario. Net annual cash flow means annual saving minus annual finance payment.",
            markdown_table(
                [
                    "Project cost",
                    "Finance rate",
                    "5-year payment",
                    "5-year net",
                    "7-year payment",
                    "7-year net",
                    "10-year payment",
                    "10-year net",
                ],
                finance_rows,
            ),
            "## Savings Needed For Target Payback",
            markdown_table(
                [
                    "Project cost",
                    "5-year payback",
                    "7-year payback",
                    "10-year payback",
                    "15-year payback",
                ],
                break_even_rows,
            ),
            "## NPV And IRR Placeholders",
            markdown_table(
                ["Metric", "Current status"],
                [
                    ["NPV", "TBD after quote, tax, maintenance, degradation, and replacement assumptions"],
                    ["IRR", "TBD after quote, tax, maintenance, degradation, and replacement assumptions"],
                    ["NPV placeholder function result", "TBD" if npv_value is None else str(npv_value)],
                    ["IRR placeholder function result", "TBD" if irr_value is None else str(irr_value)],
                ],
            ),
            "## Notes",
            "\n".join(
                [
                    "- This model uses the current $1,200/month bill as the primary financial baseline.",
                    "- The 93 kWh/day usage figure supports system sizing but does not replace interval data.",
                    "- Maintenance and battery replacement allowances are placeholders until supplier quotes are received.",
                    "- Tax, depreciation, GST, financing fees, export revenue, demand charges, and tariff changes are not yet modelled.",
                    "- This is planning material, not tax or financial advice.",
                ]
            ),
            "",
        ]
    )


def main() -> None:
    OUTPUT_PATH.write_text(build_output(), encoding="utf-8")
    print(f"Wrote {OUTPUT_PATH}")


if __name__ == "__main__":
    main()
