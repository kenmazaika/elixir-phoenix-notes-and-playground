defmodule Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url "ecto://postgres:password@localhost/phoenix_crud2"
  end

  def priv do
    app_dir(:phoenix_crud, "priv/repo")
  end
end
