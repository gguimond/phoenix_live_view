defmodule LiveViewPlaygroundWeb.PageController do
  use LiveViewPlaygroundWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
