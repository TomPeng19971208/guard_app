defmodule CampusPoliceWeb.TypeController do
  use CampusPoliceWeb, :controller

  alias CampusPolice.Types
  alias CampusPolice.Types.Type

  action_fallback CampusPoliceWeb.FallbackController

  def index(conn, _params) do
    types = Types.list_types()
    render(conn, "index.json", types: types)
  end

  def create(conn, %{"type" => type_params}) do
    with {:ok, %Type{} = type} <- Types.create_type(type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.type_path(conn, :show, type))
      |> render("show.json", type: type)
    end
  end

  def show(conn, %{"id" => id}) do
    type = Types.get_type!(id)
    render(conn, "show.json", type: type)
  end

  def update(conn, %{"id" => id, "type" => type_params}) do
    type = Types.get_type!(id)

    with {:ok, %Type{} = type} <- Types.update_type(type, type_params) do
      render(conn, "show.json", type: type)
    end
  end

  def delete(conn, %{"id" => id}) do
    type = Types.get_type!(id)

    with {:ok, %Type{}} <- Types.delete_type(type) do
      send_resp(conn, :no_content, "")
    end
  end
end
