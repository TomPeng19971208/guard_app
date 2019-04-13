defmodule CampusPoliceWeb.RecordView do
  use CampusPoliceWeb, :view
  alias CampusPoliceWeb.RecordView

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
      y: record.y}
  end
end
