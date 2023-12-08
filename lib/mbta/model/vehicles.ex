# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.Vehicles do
  @moduledoc """
  A page of [VehicleResource](#vehicleresource) results
  """

  @derive Jason.Encoder
  defstruct [
    :links,
    :data
  ]

  @type t :: %__MODULE__{
    :links => MBTA.Model.VehiclesLinks.t | nil,
    :data => [MBTA.Model.VehicleResource.t]
  }

  alias MBTA.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:links, :struct, MBTA.Model.VehiclesLinks)
     |> Deserializer.deserialize(:data, :list, MBTA.Model.VehicleResource)
  end
end
