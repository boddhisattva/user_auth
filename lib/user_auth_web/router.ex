defmodule UserAuthWeb.Router do
  use UserAuthWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :api do
    plug :accepts, ["json"]

    plug Coherence.Authentication.Token
  end



  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", UserAuthWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/", UserAuthWeb do
    pipe_through :protected

    # add protected resources below
    resources "/privates", UserAuthWeb.PrivateController
  end

  # Other scopes may use custom stacks.
  # scope "/api", UserAuthWeb do
  #   pipe_through :api
  # end
end
