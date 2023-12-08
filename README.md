# MBTA SDK

SDK for the MBTA service API https://github.com/mbta/api.

## Configuration

```elixir
config :tesla, MBTA.Connection,
  middleware: [
    {Tesla.Middleware.BaseUrl, System.get_env("V3_API_URL")},
    {Tesla.Middleware.Headers, [{"x-api-key", System.get_env("V3_API_KEY")}]}
  ]
```

## Usage

```elixir
client = MBTA.Connection.new()

south_station = MBTA.Api.Stop.api_web_stop_controller_show(client, "place-sstat")
```