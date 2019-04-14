defmodule CampusPolice.Types.Type do
  use Ecto.Schema
  import Ecto.Changeset

  schema "types" do
    field :name, :string
    many_to_many :records, CampusPolice.Records.Record,
    join_through: "recordtype",
    join_keys: [type_id: :id, record_id: :id],
    on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(type, attrs) do
    type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
