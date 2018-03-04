# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :brgy_website,
  ecto_repos: [BrgyWebsite.Repo]

# Configures the endpoint
config :brgy_website, BrgyWebsiteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ATpOy8QknVkbvEMhKkwhwt9hTtKg1g9A3zL+ZafPGIZOHcKFk3FePLnuP4vSDrJo",
  render_errors: [view: BrgyWebsiteWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BrgyWebsite.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :brgy_website, BrgyWebsiteW.Schemas.Guardian,
  issuer: "BrgyWebsite", # Name of your app/company/product
  secret_key: "UT/gm7t7T9DZJNFDC7X5GGOviV2SoXLmqAvYR9lmKybDZFXUbHTwTh2rTZ/0Qgn3" # Replace this with the output of the mix command

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
