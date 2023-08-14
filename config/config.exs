# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :urler_web,
  ecto_repos: [UrlerWeb.Repo],
  generators: [context_app: false]

# Configures the endpoint
config :urler_web, UrlerWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: UrlerWeb.ErrorHTML, json: UrlerWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: UrlerWeb.PubSub,
  live_view: [signing_salt: "Zcf6Ekf9"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/urler_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../apps/urler_web/assets", __DIR__)
  ]

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :urler_svc, bing_url: System.get_env("BING_URL")
config :urler_svc, bing_page_limit: System.get_env("BING_PAGE_LIMIT")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
