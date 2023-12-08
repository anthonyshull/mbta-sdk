import Config

if base_url = System.get_env("V3_API_URL") do
  config :mbta_sdk, base_url: base_url
end
