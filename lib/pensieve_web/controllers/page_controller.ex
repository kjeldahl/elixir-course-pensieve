defmodule PensieveWeb.PageController do
  use PensieveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
