defmodule Home.PostController do
  use Home.Web, :controller
  alias Home.Post

  plug :action

  def index(conn, _params) do
    render conn, "index.html", posts: Post.all
  end

  def show(conn, %{"title" => title}) do
    render conn, "show.html", post: Post.read(title)
  end
end
