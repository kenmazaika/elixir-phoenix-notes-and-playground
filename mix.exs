defmodule PhoenixCrud.Mixfile do
  use Mix.Project

  def project do
    [app: :phoenix_crud,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: { PhoenixCrud, [] },
      applications: [:phoenix, :cowboy, :logger, :postgrex, :ecto]
    ]
  end

  defp deps do
    [
      {:phoenix, github: "phoenixframework/phoenix"},
      {:cowboy, "~> 1.0.0"},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 0.2.0"},
      {:exrm, "~> 0.14.10"}
    ]
  end
end
