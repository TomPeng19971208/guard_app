defmodule CampusPolice.Repo.Migrations.Recordtype do
  use Ecto.Migration

  def change do
    create table(:recordtype) do
      add :record_id, references(:records, on_delete: :delete_all), null: false
      add :type_id, references(:types, on_delete: :delete_all), null: false
    end

    create index(:recordtype, [:record_id])
    create index(:recordtype, [:type_id])
  end
end
