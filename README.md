# MBTA SDK

SDK for the MBTA service API https://github.com/mbta/api.

## Configuration

You can override the URL of your server (e.g. if you have a separate development and production server in your
configuration files).

```elixir
config :mbta, base_url: "http://localhost:4000"
```

Multiple clients for the same API with different URLs can be created passing different `base_url`s when calling
`MBTA.Connection.new/1`:

```elixir
client = MBTA.Connection.new(base_url: "http://localhost:4000")
```