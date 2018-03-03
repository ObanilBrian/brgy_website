defmodule BrgyWebsite.Schemas.Blotter do
  use Ecto.Schema
  import Ecto.Changeset
  alias BrgyWebsite.Schemas.Blotter

  schema "blotters" do
    field :c_first_name, :string
    field :c_middle_name, :string
    field :c_last_name, :string
    field :c_address, :string
    field :c_phone, :string
    field :r_first_name, :string
    field :r_middle_name, :string
    field :r_last_name, :string
    field :r_address, :string
    field :r_phone, :string
    field :case, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(%Blotter{} = blotter, attrs) do
    blotter
    |> cast(attrs, [
      :c_first_name,
      :c_middle_name,
      :c_last_name,
      :c_address,
      :c_phone,
      :r_first_name,
      :r_middle_name,
      :r_last_name,
      :r_address,
      :r_phone,
      :case,
      :description
    ])
  end
end