defmodule CampusPolice.Repo.Migrations.CreateRecords do
  use Ecto.Migration

  def change do
    create table(:records) do
      add :date, :utc_datetime, null: false
      add :zip, :string, null: false
      add :description, :string, default: ""
      add :"x", :float, null: false
      add :"y", :float, null: false
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:records, [:user_id])
  end
end
