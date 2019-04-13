defmodule CampusPoliceWeb.Router do
  use CampusPoliceWeb, :router
  alias CampusPoliceWeb.UserController
  alias CampusPoliceWeb.RecordController
  alias CampusPoliceWeb.TypeController


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

  scope "/", CampusPoliceWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/records", RecordController, except: [:new, :edit]
    resources "/types", TypeController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", CampusPoliceWeb do
  #   pipe_through :api
  # end
end
