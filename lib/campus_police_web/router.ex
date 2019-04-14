defmodule CampusPoliceWeb.Router do
  use CampusPoliceWeb, :router
  alias CampusPoliceWeb.UserController
  alias CampusPoliceWeb.RecordController
  alias CampusPoliceWeb.TypeController
  alias CampusPoliceWeb.AuthController


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
    get "/near_by_records", RecordController, :get_records_nearby
    post "/auth", AuthController, :authenticate
    post "/inform_residents", RecordController, :inform_residents
    post "/inform_individual", RecordController, :inform_individual
    get "/address_info", RecordController, :get_address_info
  end

  # Other scopes may use custom stacks.
  # scope "/api", CampusPoliceWeb do
  #   pipe_through :api
  # end
end
