defmodule UserAuthWeb.PageController do
  use UserAuthWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
