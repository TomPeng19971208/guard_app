defmodule CampusPolice.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :address, :string
    field :pasword, :string
    field :phone, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:address, :username, :pasword, :phone])
    |> validate_required([:address, :username, :pasword, :phone])
  end
end
