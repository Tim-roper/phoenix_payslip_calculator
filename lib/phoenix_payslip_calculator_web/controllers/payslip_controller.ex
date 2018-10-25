defmodule PhoenixPayslipCalculatorWeb.PayslipController do
  use PhoenixPayslipCalculatorWeb, :controller

  def calculate(conn, _params) do
    render conn, "index.html", firstname: conn.params["employee"]["firstname"]
  end
end
