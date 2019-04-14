defmodule CampusPoliceWeb.UserView do
  use CampusPoliceWeb, :view
  alias CampusPoliceWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      address: user.address,
      username: user.username,
      phone: user.phone,
      lat: user.y,
      lng: user.x,
      zip: user.zip
    }
  end
end
