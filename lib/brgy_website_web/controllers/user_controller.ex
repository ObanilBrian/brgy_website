defmodule BrgyWebsiteWeb.UserController do
  use BrgyWebsiteWeb, :controller
  import Ecto.{Query, Changeset}, warn: false

  alias BrgyWebsite.{
    Repo,
    Schemas.User
  }

  def add_user(conn, params) do
    user = %{
      first_name: params["first_name"],
      middle_name: params["middle_name"],
      last_name: params["last_name"],
      username: params["username"],
      password: params["password"],
    }

    %User{}
    |> User.changeset(user)
    |> Repo.insert!()
  end

  def get_user_by_id(conn, params) do
    user_id = params["user_id"]

    User
    |> Repo.get_by(id: user_id)
    |> Repo.one
  end
end