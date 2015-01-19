# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :phoenix_crud, PhoenixCrud.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gdvAykmlmy8c+s2SX4rp6yymghJYRmuRe2RkX67C93hSL5MyvJ7huf4pTohlmUZR",
  debug_errors: false,
  server: true

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
import_config "database.exs"
