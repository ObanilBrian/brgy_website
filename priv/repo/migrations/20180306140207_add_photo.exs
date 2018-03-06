defmodule BrgyWebsite.Repo.Migrations.AddPhoto do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :name, :string
      add :filename, :string
      
      timestamps()
    end
  end
end
