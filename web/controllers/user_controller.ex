defmodule PhoenixCrud.UserController do
  use Phoenix.Controller
  plug :action

  alias PhoenixCrud.Router

  def index(conn, _params) do
    render conn, "index.html", users: Repo.all(PhoenixCrud.User)
  end
  def show(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    user = UserQuery.find(id)
    render conn, "show.html", user: user
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"user" => %{"content" => content}}) do
    user = %PhoenixCrud.User{content: content}
    user = Repo.insert(user)
    render conn, "show.html", user: user
  end

  def edit(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    user =  UserQuery.find(id)
    render conn, "edit.html", user: user  end

  def update(conn, %{"id" => id, "user" => params}) do
    {id, _} = Integer.parse(id)
    user = UserQuery.find(id)
    user = %{user | content: params["content"]}
    Repo.update(user)
    json conn, %{location: PhoenixCrud.Router.Helpers.user_path(Endpoint, :show, user.id)}
  end

  def destroy(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    user = UserQuery.find(id)
    Repo.delete(user)
    redirect conn, to: PhoenixCrud.Router.Helpers.user_path(Endpoint, :index)

  end
end
