defmodule BrgyWebsiteWeb.PageController do
  use BrgyWebsiteWeb, :controller
  import Ecto.{Query, Changeset}, warn: false

  alias BrgyWebsite.{
    Repo,
    Schemas.User,
    Schemas.Blotter,
    Schemas.News,
    Schemas.Official,
    Schemas.Auth,
    Schemas.Guardian
  }

  def index(conn, _params) do
    conn
    |> render("index.html")
  end

  def about(conn, _params) do
    official = 
      Official
      |> Repo.all

    render conn, "about.html", official: official
  end

  def report(conn, _params) do
    changeset = 
      Blotter.changeset(%Blotter{}, %{})

    conn
    |> render(
      "reports.html",
      changeset: changeset) 
  end

  def login(conn, _params) do
    changeset = 
      User.changeset(%User{}, %{}) 
    render conn, "login.html", changeset: changeset
  end

  def validate_login(conn, %{"user" => user}) do
    username = user["username"]
    password = user["password"]

    Auth.authenticate_user(username, password)
    |> login_reply(conn)

    # user = 
    #   User
    #   |> where([u], ilike(u.username, ^username))
    #   |> Repo.all
    
    # if Enum.empty?(user) do
    #   changeset = 
    #     User.changeset(%User{}, %{}) 
    #   conn
    #   |> put_flash(:error, "Username does not exist!")
    #   |> render("login.html", changeset: changeset)
    # else
    #   if not is_nil(List.first(user)) do
    #     user = List.first(user)
    #     if user.password == password do
    #       conn
    #       |> put_flash(:info, "Welcome back!")
    #       |> redirect(to: "/blotter")
    #     else
    #       changeset = 
    #         User.changeset(%User{}, %{}) 
    #       conn
    #       |> put_flash(:error, "Password is invalid!")
    #       |> render("login.html", changeset: changeset)
    #     end
    #   else
    #     changeset = 
    #         User.changeset(%User{}, %{}) 
    #     conn
    #     |> put_flash(:error, "Password is invalid!")
    #     |> render("login.html", changeset: changeset)
    #   end
    # end
  end

  defp login_reply({:error, error}, conn) do
    conn
    |> put_flash(:error, error)
    |> redirect(to: "/login")
  end

  defp login_reply({:ok, user}, conn) do
    conn
    |> put_flash(:success, "Welcome back!")
    |> Guardian.Plug.sign_in(user)
    |> redirect(to: "/blotter")
  end

  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> redirect(to: page_path(conn, :login))
  end

  # Start of NEWS

  def load_all_news(conn, _params) do
    news = 
      News
      |> Repo.all

    conn
    |> render(
      "news.html",
      news: news) 
  end

  def load_news(conn, %{"id" => id}) do
    news =
      News
      |> where([b], b.id == ^id)
      |> Repo.one
    
    conn
    |> render(
      "view_news.html",
      news: news) 
  end

  def add_news(conn, %{"news" => news}) do
    news_record = 
      %News{}
      |> News.changeset(news)
      |> Repo.insert!
    
    conn
    |> render(
      "view_news.html",
      news: news_record) 
  end

  def update_news(conn, %{"id" => id, "news" => news}) do
    news_record =
      News
      |> where([b], b.id == ^id)
      |> Repo.one

    news_record
    |> News.changeset(news)
    |> Repo.update!

    conn
    |> render(
      "view_news.html",
      news: news_record) 
  end

  def delete_news(conn, %{"id" => id, "news" => news}) do
    news_record =
      News
      |> where([b], b.id == ^id)
      |> Repo.one

    news_record
    |> Repo.delete

    news = 
      News
      |> Repo.all 

    conn
    |> render(
      "news.html",
      news: news) 
  end

  # End of NEWS

  # Start of OFFICIAL

  def load_all_official(conn, _params) do
    official = 
      Official
      |> Repo.all

    conn
    |> render(
      "official.html",
      official: official) 
  end

  def load_official(conn, %{"id" => id}) do
    official =
      Official
      |> where([b], b.id == ^id)
      |> Repo.one
    
    params = %{
      first_name: official.first_name,
      middle_name: official.middle_name,
      last_name: official.last_name,
      position: official.position
    }

    changeset = 
      Official.changeset(%Official{}, params)
    
    conn
    |> render(
      "view_official.html",
      official: official,
      changeset: changeset) 
  end

  def new_official(conn, _) do
    changeset = 
      Official.changeset(%Official{}, %{})

    conn
    |> render(
      "new_official.html",
      changeset: changeset) 
  end

  def add_official(conn, %{"official" => official}) do
    if upload = official["picture"] do
      extension = Path.extname(upload.filename)
      name = "#{official["first_name"]} #{official["middle_name"]} #{official["last_name"]}"
      File.cp(upload.path, "/media/#{name}-profile#{extension}")
    end
    
    official_record = 
      %Official{}
      |> Official.changeset(official)
      |> Repo.insert!

    conn
    |> redirect(to: "/official")
  end

  def update_official(conn, %{"id" => id, "official" => official}) do
    official_record =
      Official
      |> where([b], b.id == ^id)
      |> Repo.one

    official_record
    |> Official.changeset(official)
    |> Repo.update!

    conn
    |> redirect(to: "/official")
  end

  def delete_official(conn, %{"id" => id}) do
    official_record =
      Official
      |> where([b], b.id == ^id)
      |> Repo.one

    official_record
    |> Repo.delete!

    conn
    |> redirect(to: "/official")
  end

  # End of OFFICIAL

  # Start of USER

  def load_all_user(conn, _params) do
    user = 
      User
      |> Repo.all

    conn
    |> render(
      "user.html",
      user: user) 
  end

  def load_user(conn, %{"id" => id}) do
    user =
      User
      |> where([b], b.id == ^id)
      |> Repo.one
    
    params = %{
      first_name: user.first_name,
      middle_name: user.middle_name,
      last_name: user.last_name,
      username: user.username,
      password: user.password
    }

    changeset = 
      User.changeset(%User{}, params)
    
    conn
    |> render(
      "view_user.html",
      user: user,
      changeset: changeset) 
  end

  def new_user(conn, _) do
    changeset = 
      User.changeset(%User{}, %{})

    conn
    |> render(
      "new_user.html",
      changeset: changeset) 
  end

  def add_user(conn, %{"user" => user}) do
    user_record = 
      %User{}
      |> User.changeset(user)
      |> Repo.insert!
    
    conn
    |> redirect(to: "/user")
  end

  def update_user(conn, %{"id" => id, "user" => user}) do
    user_record =
      User
      |> where([b], b.id == ^id)
      |> Repo.one

    user_record
    |> User.changeset(user)
    |> Repo.update!

    conn
    |> redirect(to: "/user")
  end

  def delete_user(conn, %{"id" => id}) do
    user_record =
      User
      |> where([b], b.id == ^id)
      |> Repo.one

    user_record
    |> Repo.delete

    conn
    |> redirect(to: "/user")
  end

  # End of USER
    
  # Start of BLOTTER

  def load_all_blotters(conn, _params) do
    blotters = 
      Blotter
      |> Repo.all

    conn
    |> render(
      "blotter.html",
      blotters: blotters) 
  end

  def load_blotter(conn, %{"id" => id}) do
    blotter =
      Blotter
      |> where([b], b.id == ^id)
      |> Repo.one
    
    params = %{
      c_first_name: blotter.c_first_name,
      c_middle_name: blotter.c_middle_name,
      c_last_name: blotter.c_last_name,
      c_address: blotter.c_address,
      c_phone: blotter.c_phone,
      r_first_name: blotter.r_first_name,
      r_middle_name: blotter.r_middle_name,
      r_last_name: blotter.r_last_name,
      r_address: blotter.r_address,
      r_phone: blotter.r_phone,
      case: blotter.case,
      description: blotter.description
    }

    changeset = 
      Blotter.changeset(%Blotter{}, params)
    
    conn
    |> render(
      "view_blotter.html",
      blotter: blotter,
      changeset: changeset) 
  end

  def add_blotter(conn, %{"blotter" => blotter}) do
    blotter_record = 
      %Blotter{}
      |> Blotter.changeset(blotter)
      |> Repo.insert!
    
    conn
    |> redirect(to: "/")
  end

  def update_blotter(conn, %{"id" => id, "blotter" => blotter}) do
    blotter_record =
      Blotter
      |> where([b], b.id == ^id)
      |> Repo.one

    blotter_record
    |> Blotter.changeset(blotter)
    |> Repo.update!

    conn
    |> render(
      "view_blotter.html",
      blotter: blotter_record) 
  end

  # End of BLOTTER

  
end
