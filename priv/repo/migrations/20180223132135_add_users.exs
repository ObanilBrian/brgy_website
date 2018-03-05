defmodule BrgyWebsite.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :middle_name, :string
      add :last_name, :string
      add :username, :string
      add :password, :string
      
      timestamps()
    end
    create unique_index(:users, [:username])
  end
end
