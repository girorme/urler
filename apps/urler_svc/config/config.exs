import Config

config :urler_svc, bing_url: System.get_env("BING_URL")
config :urler_svc, bing_page_limit: System.get_env("BING_PAGE_LIMIT")
