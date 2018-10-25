defmodule PhoenixPayslipCalculatorWeb.PageController do
  use PhoenixPayslipCalculatorWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
