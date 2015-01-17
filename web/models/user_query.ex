defmodule UserQuery do
  import Ecto.Query

  def find(user_id) do
    query = from r in PhoenixCrud.User,
    where: r.id == ^user_id,
    select: r
    Repo.all(query)
  end
end
