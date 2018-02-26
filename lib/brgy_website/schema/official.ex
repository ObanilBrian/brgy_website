defmodule BrgyWebsite.Schemas.Official do
  use Ecto.Schema
  import Ecto.Changeset
  alias BrgyWebsite.Schemas.Official

  schema "officials" do
    field :first_name, :string
    field :middle_name, :string
    field :last_name, :string
    field :position, :string
    field :picture, :string

    timestamps()
  end

  @doc false
  def changeset(%Official{} = official, attrs) do
    official
    |> cast(attrs, [
      :first_name,
      :middle_name,
      :last_name,
      :position,
      :picture
      ])
  end
end