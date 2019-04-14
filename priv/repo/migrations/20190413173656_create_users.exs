defmodule CampusPolice.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :address, :string
      add :username, :string
      add :password_hash, :string
      add :phone, :string
      add :x, :float
      add :y, :float
      timestamps()
    end

  end
end
