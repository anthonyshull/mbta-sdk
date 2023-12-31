# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.RoutePatternResource do
  @moduledoc """
  Information about the different variations of service that may be run within a single route_id, including when and how often they are operated. See [GTFS `route_patterns.txt](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#route_patternstxt) for the base specification. 
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
    :relationships => MBTA.Model.RoutePatternResourceRelationships.t | nil,
    :links => map() | nil,
    :id => String.t | nil,
    :attributes => MBTA.Model.RoutePatternResourceAttributes.t | nil
  }

  alias MBTA.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:relationships, :struct, MBTA.Model.RoutePatternResourceRelationships)
     |> Deserializer.deserialize(:attributes, :struct, MBTA.Model.RoutePatternResourceAttributes)
  end
end

