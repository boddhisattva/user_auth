# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :user_auth,
  ecto_repos: [UserAuth.Repo]

# Configures the endpoint
config :user_auth, UserAuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OcqoKzFijvv/5lmzygel9GXY9yyQE9839yDZLWBVjolcxAB7VXR49jbfyR6hyYe+",
  render_errors: [view: UserAuthWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: UserAuth.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
