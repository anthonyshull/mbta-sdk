# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.TripResourceRelationshipsService do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :links,
    :data
  ]

  @type t :: %__MODULE__{
    :links => MBTA.Model.TripResourceRelationshipsServiceLinks.t | nil,
    :data => MBTA.Model.TripResourceRelationshipsServiceData.t | nil
  }

  alias MBTA.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:links, :struct, MBTA.Model.TripResourceRelationshipsServiceLinks)
     |> Deserializer.deserialize(:data, :struct, MBTA.Model.TripResourceRelationshipsServiceData)
  end
end

