defmodule CampusPolice.Records.Record do
  use Ecto.Schema
  import Ecto.Changeset

  schema "records" do
    field :date, :utc_datetime
    field :description, :string
    field :"x", :float
    field :"y", :float
    field :zip, :string
    belongs_to :user, CampusPolice.Users.User
    many_to_many :types, CampusPolice.Types.Type,
    join_through: "recordtype",
    join_keys: [record_id: :id, type_id: :id],
    on_replace: :delete
    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:date, :zip, :description, :x, :y, :user_id])
    |> validate_required([:date, :zip, :description, :"x", :"y"])
  end
end
