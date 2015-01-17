defmodule PhoenixCrud.PageController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"page" => "unauthorized"}) do
    render conn, "unauthorized"
  end

  def show(conn, %{"page" => page}) do
    render conn, "show", page: page
  end
end
