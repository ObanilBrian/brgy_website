defmodule BrgyWebsite.Repo.Migrations.AddNews do
  use Ecto.Migration

  def change do
    create table(:news) do
      add :title, :string
      add :subtitle, :string
      add :author, :string
      add :content, :text
      add :banner, :binary
      
      timestamps()
    end
  end
end
