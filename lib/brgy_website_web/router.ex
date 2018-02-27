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
  end

  # Other scopes may use custom stacks.
  # scope "/api", BrgyWebsiteWeb do
  #   pipe_through :api
  # end
end
