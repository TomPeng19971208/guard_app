defmodule CampusPolice.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :address, :string
    field :pasword_hash, :string
    field :phone, :string
    field :username, :string
    has_many :records, CampusPolice.Records.Record

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:address, :username, :pasword_hash, :phone])
    |> validate_required([:address, :username, :pasword_hash, :phone])
  end
end
