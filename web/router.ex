defmodule Home.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Home do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/projects", PageController, :projects
  end

  scope "/posts", Home do
    pipe_through :browser

    get "/", PostController, :index
    get "/:title", PostController, :show
  end
end
