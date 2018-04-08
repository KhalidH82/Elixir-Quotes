defmodule QuoterWeb.Router do
  use QuoterWeb, :router

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

  scope "/", QuoterWeb do
    pipe_through :browser # Use the default browser stack

    get "/", QuoteController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", QuoterWeb do
  #   pipe_through :api
  # end
end
