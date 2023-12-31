# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.FacilityProperty do
  @moduledoc """
  Name/value pair for additional facility information
  """

  @derive Jason.Encoder
  defstruct [
    :name
  ]

  @type t :: %__MODULE__{
    :name => String.t | nil
  }

  def decode(value) do
    value
  end
end

