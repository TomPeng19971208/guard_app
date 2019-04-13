use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :campus_police, CampusPoliceWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :campus_police, CampusPolice.Repo,
  username: "postgres",
  password: "postgres",
  database: "campus_police_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
