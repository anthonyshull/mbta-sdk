# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Model.PredictionResourceRelationships do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :vehicle,
    :trip,
    :stop,
    :schedule,
    :route,
    :alerts
  ]

  @type t :: %__MODULE__{
    :vehicle => MBTA.Model.PredictionResourceRelationshipsVehicle.t | nil,
    :trip => MBTA.Model.ScheduleResourceRelationshipsTrip.t | nil,
    :stop => MBTA.Model.ScheduleResourceRelationshipsStop.t | nil,
    :schedule => MBTA.Model.PredictionResourceRelationshipsSchedule.t | nil,
    :route => MBTA.Model.ScheduleResourceRelationshipsRoute.t | nil,
    :alerts => MBTA.Model.PredictionResourceRelationshipsAlerts.t | nil
  }

  alias MBTA.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:vehicle, :struct, MBTA.Model.PredictionResourceRelationshipsVehicle)
     |> Deserializer.deserialize(:trip, :struct, MBTA.Model.ScheduleResourceRelationshipsTrip)
     |> Deserializer.deserialize(:stop, :struct, MBTA.Model.ScheduleResourceRelationshipsStop)
     |> Deserializer.deserialize(:schedule, :struct, MBTA.Model.PredictionResourceRelationshipsSchedule)
     |> Deserializer.deserialize(:route, :struct, MBTA.Model.ScheduleResourceRelationshipsRoute)
     |> Deserializer.deserialize(:alerts, :struct, MBTA.Model.PredictionResourceRelationshipsAlerts)
  end
end

