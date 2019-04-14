defmodule CampusPoliceWeb.RecordView do
  use CampusPoliceWeb, :view
  alias CampusPoliceWeb.RecordView
  alias CampusPolice.Users

  def render("index.json", %{records: records}) do
    %{data: render_many(records, RecordView, "record.json")}
  end

  def render("show.json", %{record: record}) do
    %{data: render_one(record, RecordView, "record.json")}
  end

  def render("record.json", %{record: record}) do
    %{id: record.id,
      date: record.date,
      zip: record.zip,
      description: record.description,
      x: record.x,
      y: record.y,
      user: %{name: record.user.username, phone: record.user.phone}
    }
  end

  def render("address_info.json", %{data: data}) do
    %{address: data.address, zip: data.zip}
  end
end
