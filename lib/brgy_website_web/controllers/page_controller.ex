defmodule BrgyWebsiteWeb.PageController do
  use BrgyWebsiteWeb, :controller
  import Ecto.{Query, Changeset}, warn: false

  alias BrgyWebsite.{
    Repo,
    Schemas.User,
    Schemas.Blotter,
    Schemas.News,
    Schemas.Official,
  }

  def index(conn, _params) do
    render conn, "index.html"
  end

  def about(conn, _params) do
    render conn, "about.html"
  end

  def report(conn, _params) do
    render conn, "reports.html"
  end

  def login(conn, _params) do
    render conn, "login.html"
  end

  def load_all_blotters(conn, _params) do
    blotters = 
      Blotter
      |> Repo.all

    conn
    |> render(
      "blotter.html",
      blotters: blotters) 
  end

  def edit_blotters(conn, %{"id" => id}) do
    blotter =
      Blotter
      |> where([b], b.id == ^id)
      |> Repo.one
    
    conn
    |> render(
      "edit_blotter.html",
      blotter: blotter) 
  end

  def add_blotters(conn, _params) do
    %Blotter{}
    |> Blotter.changeset(_params)
    |> Repo.insert!
    
    conn
    |> render(
      "edit_blotter.html",
      blotter: blotter) 
  end

  
end
