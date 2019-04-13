defmodule CampusPolice.Repo.Migrations.Recordtype do
  use Ecto.Migration

  def change do
    create table(:recordtype) do
      add :record_id, references(:records, on_delete: :delete_all), null: false
      add :type_id, references(:types, on_delete: :delete_all), null: false
      timestamps()
    end
  end
end
