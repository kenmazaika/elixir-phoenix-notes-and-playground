defmodule PhoenixCrud.UserController do
  use Phoenix.Controller
  plug :action
  #use Jazz

  #alias PhoenixCrud.Router
  #alias PhoenixCrud.User

  def index(conn, _params) do
    render conn, "index.html", users: Repo.all(PhoenixCrud.User)
  end
  def show(conn, %{"id" => id}) do
    case UserQuery.find(id) do
      user when is_map(user) ->
        render conn, "show", user: user
      [] ->
        redirect conn, Router.page_path(page: "unauthorized")
    end
  end

  def new(conn, _params) do
    csrf = get_session(conn, :csrf_token)
    render conn, "new.html", csrf: csrf
  end

  def create(conn, %{"user" => %{"content" => content}}) do
    user = %PhoenixCrud.User{content: content}

        user = Repo.insert(user)
        render conn, "show.html", user: user
  end
end
