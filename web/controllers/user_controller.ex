defmodule PhoenixCrud.UserController do
  use Phoenix.Controller
  plug :action

  alias PhoenixCrud.Router

  def index(conn, _params) do
    conn
    |> assign(:users, Repo.all(PhoenixCrud.User))
    |> render("index.html")
  end
  def show(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    user = UserQuery.find(id)

    conn
    |> assign(:user, user)
    |> render("show.html")
  end

  def new(conn, _params) do
    conn
    |> render("new.html")
  end

  def create(conn, %{"user" => %{"content" => content}}) do
    user = %PhoenixCrud.User{content: content}
    user = Repo.insert(user)

    conn
    |> assign(:user, user)
    |> render("show.html")
  end

  def edit(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    user =  UserQuery.find(id)

    conn
    |> assign(:user, user)
    |> render("edit.html")
  end

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
