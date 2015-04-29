defmodule Home.PageController do
  use Home.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def about(conn, _params) do
    render conn, "about.html"
  end

  def projects(conn, _params) do
    render conn, "projects.html"
  end

  def posts(conn, _params) do
    render conn, "posts.html"
  end
end
