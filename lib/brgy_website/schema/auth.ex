defmodule BrgyWebsite.Schemas.Auth do
  import Ecto.{Query, Changeset}, warn: false
  alias Comeonin.Bcrypt
  alias BrgyWebsite.Repo
  alias BrgyWebsite.Schemas.User

  def authenticate_user(username, plain_text_password) do
    query = from u in User, where: u.username == ^username
    Repo.one(query)
    |> check_password(plain_text_password)
  end

  defp check_password(nil, _), do: {:error, "Incorrect username or password"}

  defp check_password(user, plain_text_password) do
    raise Bcrypt.checkpw(plain_text_password, user.password)
    case Bcrypt.checkpw(plain_text_password, user.password) do
      true -> {:ok, user}
      false -> {:error, "Incorrect username or password"}
    end
  end
end