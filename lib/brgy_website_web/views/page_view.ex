defmodule BrgyWebsiteWeb.PageView do
  use BrgyWebsiteWeb, :view

  import Ecto.{Query, Changeset}, warn: false

  alias BrgyWebsite.{
    Repo,
    Schemas.Official,
    Schemas.Photo
  }

  def get_image(image_id) do
    if not is_nil(image_id) do
      Photo
      |> Repo.get(image_id)
    end
  end
end
