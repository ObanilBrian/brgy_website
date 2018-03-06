defmodule BrgyWebsite.Schemas.Photo do
  use Ecto.Schema
  import Ecto.Changeset
  alias BrgyWebsite.Schemas.Photo

  use Arc.Ecto.Schema

  schema "photos" do
    field :name, :string
    field :filename, BrgyWebsite.ImageFile.Type

    timestamps()
  end

  @doc false
  def changeset(%Photo{} = photo, attrs) do
    photo
    |> cast(attrs, [
      :name,
      :filename
      ])
    |> cast_attachments(attrs, [:filename])
  end
end