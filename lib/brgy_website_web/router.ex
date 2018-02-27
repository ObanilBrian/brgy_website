defmodule BrgyWebsiteWeb.Router do
  use BrgyWebsiteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BrgyWebsiteWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/report", PageController, :report

    get "/login", PageController, :login
    
    get "/blotter", PageController, :load_all_blotters
    get "/blotter/:id", PageController, :edit_blotter
    post "/blotter", PageController, :add_blotter
    put "/blotter/:id", PageController, :update_blotter
    delete "/blotter/:id", PageController, :delete_blotter

    get "/news", PageController, :load_all_news
    get "/news/:id", PageController, :edit_news
    post "/news", PageController, :add_news
    put "/news/:id", PageController, :update_news
    delete "/news/:id", PageController, :delete_news

    get "/official", PageController, :load_all_official
    get "/official/:id", PageController, :edit_official
    post "/official", PageController, :add_official
    put "/official/:id", PageController, :update_official
    delete "/official/:id", PageController, :delete_official

    get "/user", PageController, :load_all_user
    get "/user/:id", PageController, :edit_user
    post "/user", PageController, :add_user
    put "/user/:id", PageController, :update_user
    delete "/user/:id", PageController, :delete_user

  end

  # Other scopes may use custom stacks.
  # scope "/api", BrgyWebsiteWeb do
  #   pipe_through :api
  # end
end
