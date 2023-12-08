# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.LiveFacilities do
  @moduledoc """
  A page of [LiveFacilityResource](#livefacilityresource) results
  """

  @derive Jason.Encoder
  defstruct [
    :links,
    :data
  ]

  @type t :: %__MODULE__{
    :links => MBTA.Model.VehiclesLinks.t | nil,
    :data => [MBTA.Model.LiveFacilityResource.t]
  }

  alias MBTA.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:links, :struct, MBTA.Model.VehiclesLinks)
     |> Deserializer.deserialize(:data, :list, MBTA.Model.LiveFacilityResource)
  end
end

