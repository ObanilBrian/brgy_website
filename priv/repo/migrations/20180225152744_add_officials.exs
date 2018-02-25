defmodule BrgyWebsite.Repo.Migrations.AddOfficials do
  use Ecto.Migration

  def change do
    create table(:officials) do
      add :f_name, :string
      add :m_initial, :string
      add :l_name, :string
      add :position, :string
      add :picture, :string
      
      timestamps()
    end
  end
end
