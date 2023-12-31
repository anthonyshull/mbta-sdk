# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.LiveFacilityResourceAttributes do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :updated_at,
    :properties
  ]

  @type t :: %__MODULE__{
    :updated_at => DateTime.t | nil,
    :properties => [MBTA.Model.FacilityProperty.t] | nil
  }

  alias MBTA.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:updated_at, :datetime, nil)
     |> Deserializer.deserialize(:properties, :list, MBTA.Model.FacilityProperty)
  end
end

