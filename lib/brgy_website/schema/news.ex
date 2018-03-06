defmodule BrgyWebsite.Schemas.News do
  use Ecto.Schema
  import Ecto.Changeset
  alias BrgyWebsite.Schemas.News

  schema "news" do
    field :title, :string
    field :subtitle, :string
    field :author, :string
    field :content, :string
    field :banner, :string

    timestamps()
  end

  @doc false
  def changeset(%News{} = news, attrs) do
    news
    |> cast(attrs, [
      :title,
      :subtitle,
      :author,
      :content,
      :banner
      ])
  end
end