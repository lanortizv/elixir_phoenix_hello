defmodule HelloWeb.Router do
  use HelloWeb, :router

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
  pipeline :graphql do
    plug Graphql.Context
  end

  scope "/", HelloWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    #get "/", RootController, :index
    # resources "/users", UserController, only: [:index, :show] #for all http verbose actions get post delete etc
  end
  #forward "/jobs", BackgroundJob.Plug for sending request to a particular PLUG
  # Other scopes may use custom stacks.
  scope "/api", HelloWeb do
     pipe_through :graphql
     forward "/graphiql", Absinthe.Plug.GraphiQL, schema: HelloWeb.Schema
   end
end
