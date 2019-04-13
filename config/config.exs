# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :campus_police,
  ecto_repos: [CampusPolice.Repo]

# Configures the endpoint
config :campus_police, CampusPoliceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q11jKDwAHxNNCD7VwWPM4hBqB7f7HU9KmsSrBX0pwuHJ/6ZUgVZegFoc1EPeKzvi",
  render_errors: [view: CampusPoliceWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CampusPolice.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ex_twilio, account_sid: {:system, "SID"},
                   auth_token: {:system, "TOKEN"}



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
