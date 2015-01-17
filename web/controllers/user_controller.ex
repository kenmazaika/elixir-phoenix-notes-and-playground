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
    {id, _} = Integer.parse(id)
    user = UserQuery.find(id)
    render conn, "show.html", user: user
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

  def edit(conn, %{"id" => id}) do
    user =  RepoQuery.find(id)
    render conn, "edit", user: user

  end
end
