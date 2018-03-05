defmodule BrgyWebsite.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.{Query, Changeset}, warn: false
  alias BrgyWebsite.Schemas.User
  alias Comeonin.Bcrypt
  alias BrgyWebsite.Repo

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
    |> validate_required([:username, :password])   
    |> unique_constraint(:username)  
    |> put_pass_hash()  
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end

  defp put_pass_hash(changeset), do: changeset
end