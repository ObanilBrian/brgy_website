defmodule BrgyWebsiteWeb.PageController do
  use BrgyWebsiteWeb, :controller

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
end
