defmodule CampusPolice.Repo do
  use Ecto.Repo,
    otp_app: :campus_police,
    adapter: Ecto.Adapters.Postgres
end
