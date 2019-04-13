defmodule CampusPoliceWeb.PageController do
  use CampusPoliceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
