# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.VehicleResource do
  @moduledoc """
  Current state of a vehicle on a trip.
  """

  @derive Jason.Encoder
  defstruct [
    :type,
    :relationships,
    :links,
    :id,
    :attributes
  ]

  @type t :: %__MODULE__{
    :type => String.t | nil,
    :relationships => MBTA.Model.VehicleResourceRelationships.t | nil,
    :links => map() | nil,
    :id => String.t | nil,
    :attributes => MBTA.Model.VehicleResourceAttributes.t | nil
  }

  alias MBTA.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:relationships, :struct, MBTA.Model.VehicleResourceRelationships)
     |> Deserializer.deserialize(:attributes, :struct, MBTA.Model.VehicleResourceAttributes)
  end
end

