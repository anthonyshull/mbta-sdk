# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.VehicleResourceAttributesCarriagesInner do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :occupancy_status,
    :occupancy_percentage,
    :label
  ]

  @type t :: %__MODULE__{
    :occupancy_status => String.t | nil,
    :occupancy_percentage => integer() | nil,
    :label => String.t | nil
  }

  def decode(value) do
    value
  end
end

