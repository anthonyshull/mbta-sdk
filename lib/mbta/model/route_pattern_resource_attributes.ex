# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.RoutePatternResourceAttributes do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :typicality,
    :time_desc,
    :sort_order,
    :name,
    :direction_id,
    :canonical
  ]

  @type t :: %__MODULE__{
    :typicality => integer() | nil,
    :time_desc => String.t | nil,
    :sort_order => integer() | nil,
    :name => String.t | nil,
    :direction_id => integer() | nil,
    :canonical => boolean() | nil
  }

  def decode(value) do
    value
  end
end

