defmodule ElevioWeb.Router do
  use ElevioWeb, :router

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

  scope "/", ElevioWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/articles/:id", PageController, :show
    get "/search", PageController, :search
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElevioWeb do
  #   pipe_through :api
  # end
end
