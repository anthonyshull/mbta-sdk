# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.LiveFacilityResource do
  @moduledoc """
  Live data about a given facility. 
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
    :relationships => map() | nil,
    :links => map() | nil,
    :id => String.t | nil,
    :attributes => MBTA.Model.LiveFacilityResourceAttributes.t | nil
  }

  alias MBTA.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:attributes, :struct, MBTA.Model.LiveFacilityResourceAttributes)
  end
end
