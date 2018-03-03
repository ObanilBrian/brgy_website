defmodule BrgyWebsite.Repo.Migrations.AddOfficials do
  use Ecto.Migration

  def change do
    create table(:officials) do
      add :first_name, :string
      add :middle_name, :string
      add :last_name, :string
      add :position, :string
      add :picture, :binary
      
      timestamps()
    end
  end
end
