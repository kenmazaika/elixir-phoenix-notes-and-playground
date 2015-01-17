use Mix.Config

config :ecto, PhoenixCrud.Repo,
  username: "postgres",
  password: "password",
  hostname: "localhost",
  port: 5432,
  database: "phoenix_crud2"
