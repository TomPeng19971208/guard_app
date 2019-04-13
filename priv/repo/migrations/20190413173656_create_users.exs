defmodule CampusPolice.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :address, :string
      add :username, :string
      add :pasword, :string
      add :phone, :string

      timestamps()
    end

  end
end
