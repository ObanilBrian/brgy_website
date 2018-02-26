defmodule BrgyWebsite.Repo.Migrations.AddBlotters do
  use Ecto.Migration

  def change do
    create table(:blotters) do
      add :c_first_name, :string
      add :c_middle_name, :string
      add :c_last_name, :string
      add :c_address, :string
      add :c_phone, :string
      add :r_first_name, :string
      add :r_middle_name, :string
      add :r_last_name, :string
      add :r_address, :string
      add :r_phone, :string
      add :case, :string
      add :description, :string
      
      timestamps()
    end
  end
end
