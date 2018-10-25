defmodule PhoenixPayslipCalculatorWeb.PayslipController do
  use PhoenixPayslipCalculatorWeb, :controller

  def calculate(conn, _params) do
    firstname = conn.params["employee"]["firstname"]
    lastname = conn.params["employee"]["lastname"]
    pay_period = conn.params["employee"]["payment_month"]
    annual_salary = conn.params["employee"]["annual_salary"]
                    |> String.to_integer
    {super_percentage, _} = conn.params["employee"]["super_rate"]
                      |> Float.parse
    super_rate = super_percentage / 100
    net_income = annual_salary |> PayslipCalculator.monthly_pay
    income_tax = annual_salary |> PayslipCalculator.income_tax
    superannuation = PayslipCalculator.super(super_rate, net_income)
    render conn, "index.html", firstname: firstname, lastname: lastname, pay_period: pay_period, annual_salary: annual_salary, income_tax: income_tax, net_income: net_income, superannuation: superannuation
  end
end
