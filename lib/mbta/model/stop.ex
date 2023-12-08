# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.Stop do
  @moduledoc """
  A JSON-API document with a single [StopResource](#stopresource) resource
  """

  @derive Jason.Encoder
  defstruct [
    :links,
    :included,
    :data
  ]

  @type t :: %__MODULE__{
    :links => MBTA.Model.AlertLinks.t | nil,
    :included => [MBTA.Model.AlertIncludedInner.t] | nil,
    :data => MBTA.Model.StopResource.t
  }

  alias MBTA.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:links, :struct, MBTA.Model.AlertLinks)
     |> Deserializer.deserialize(:included, :list, MBTA.Model.AlertIncludedInner)
     |> Deserializer.deserialize(:data, :struct, MBTA.Model.StopResource)
  end
end

