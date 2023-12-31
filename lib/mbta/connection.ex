# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Connection do
  @moduledoc false

  @typedoc """
  The list of options that can be passed to new/1.

  - `base_url`: Overrides the base URL on a per-client basis.
  - `user_agent`: Overrides the User-Agent header.
  """
  @type options :: [
          {:base_url, String.t()},
          {:user_agent, String.t()}
        ]

  @doc "Forward requests to Tesla."
  @spec request(Tesla.Client.t(), [Tesla.option()]) :: Tesla.Env.result()
  defdelegate request(client, options), to: Tesla

  @doc """
  Configure a client with no authentication.

  ### Returns

  Tesla.Env.client
  """
  @spec new() :: Tesla.Env.client()
  def new do
    Tesla.client(middleware(), adapter())
  end

  @doc """
  Configure a client that may have authentication.

  ### Parameters

  - `options`: a keyword list of OpenAPIPetstore.Connection.options.

  ### Returns

  Tesla.Env.client
  """
  @spec new(options) :: Tesla.Env.client()

  def new(options) when is_list(options) do
    options
    |> middleware()
    |> Tesla.client(adapter())
  end

  @doc """
  Returns fully configured middleware for passing to Tesla.client/2.
  """
  @spec middleware(options) :: [Tesla.Client.middleware()]
  def middleware(options \\ []) do
    tesla_options = Application.get_env(:tesla, __MODULE__, [])
    middleware = Keyword.get(tesla_options, :middleware, [])
    json_engine = Keyword.get(tesla_options, :json, Jason)

    user_agent =
      Keyword.get(
        options,
        :user_agent,
        Keyword.get(
          tesla_options,
          :user_agent,
          "openapi-generator - MBTA 3.0 - elixir"
        )
      )

    [
      {Tesla.Middleware.Headers, [{"user-agent", user_agent}]},
      {Tesla.Middleware.EncodeJson, engine: json_engine}
      | middleware
    ]
  end

  @doc """
  Returns the default adapter for this API.
  """
  def adapter do
    :tesla
    |> Application.get_env(__MODULE__, [])
    |> Keyword.get(:adapter, nil)
  end
end
