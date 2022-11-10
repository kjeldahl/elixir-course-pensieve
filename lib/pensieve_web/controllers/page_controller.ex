defmodule PensieveWeb.PageController do
  use PensieveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def about(conn, _params) do
    render(conn, "about.html", message: "Grettings to Jake Moosey")
  end

  def info(conn, _params) do
    render(conn, "info.html")
  end
end
