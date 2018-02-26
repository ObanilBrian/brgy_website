defmodule BrgyWebsite.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias BrgyWebsite.Schemas.User

  schema "users" do
    field :first_name, :string
    field :middle_name, :string
    field :last_name, :string
    field :username, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [
      :first_name,
      :middle_name,
      :last_name,
      :username,
      :password
      ])
  end
end