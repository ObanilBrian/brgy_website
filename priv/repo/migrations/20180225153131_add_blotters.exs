defmodule BrgyWebsite.Repo.Migrations.AddBlotters do
  use Ecto.Migration

  def change do
    create table(:blotters) do
      add :c_f_name, :string
      add :c_m_initial, :string
      add :c_l_name, :string
      add :c_address, :string
      add :c_phone, :string
      add :r_f_name, :string
      add :r_m_initial, :string
      add :r_l_name, :string
      add :r_address, :string
      add :r_phone, :string
      add :case, :string
      add :description, :string
      
      timestamps()
    end
  end
end
