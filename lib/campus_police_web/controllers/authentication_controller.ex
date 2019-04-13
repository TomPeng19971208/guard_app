defmodule CampusPoliceWeb.AuthController do
  use CampusPoliceWeb, :controller

  alias CampusPolice.Users
  alias CampusPolice.Users.User

  action_fallback CampusPoliceWeb.FallbackController

  def authenticate(conn, %{"name" => name, "password" => password}) do
    with {:ok, %User{} = user} <- Users.authenticate_user(name, password) do
      resp = %{
        data: %{
          token: Phoenix.Token.sign(CampusPoliceWeb.Endpoint, "user_id", user.id),
          user_id: user.id,
        }
      }
      IO.inspect(resp.data.token)
      conn
      |> put_resp_header("content-type", "application/json; charset=UTF-8")
      |> send_resp(:created, Jason.encode!(resp))
    end
  end
end
