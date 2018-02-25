defmodule BrgyWebsite.Repo.Migrations.AddNews do
  use Ecto.Migration

  def change do
    create table(:news) do
      add :title, :string
      add :subtitle, :string
      add :date_posted, :string
      add :user_id, references(:users)
      add :content, :string
      
      timestamps()
    end
  end
end
