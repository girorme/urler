import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :urler_web, UrlerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wNd+fLIiRTHJ81LyytsvXQ6BT5aRz/LN4gwP/FeJLOpS3z2CpWGHyMraTqTd/Gxr",
  server: false
