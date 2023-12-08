# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.PredictionResourceAttributes do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :stop_sequence,
    :status,
    :schedule_relationship,
    :direction_id,
    :departure_time,
    :arrival_time
  ]

  @type t :: %__MODULE__{
    :stop_sequence => integer() | nil,
    :status => String.t | nil,
    :schedule_relationship => String.t | nil,
    :direction_id => integer() | nil,
    :departure_time => String.t | nil,
    :arrival_time => String.t | nil
  }

  def decode(value) do
    value
  end
end

