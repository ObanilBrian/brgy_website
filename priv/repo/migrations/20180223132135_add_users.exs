defmodule BrgyWebsite.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :f_name, :string
      add :m_initial, :string
      add :l_name, :string
      add :username, :string
      add :password, :string
      
      timestamps()
    end
  end
end
