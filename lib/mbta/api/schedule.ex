# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Api.Schedule do
  @moduledoc """
  API calls for all endpoints tagged `Schedule`.
  """

  alias MBTA.Connection
  import MBTA.RequestBuilder

  @doc """
  **NOTE:** `filter[route]`, `filter[stop]`, or `filter[trip]` **MUST** be present for any schedules to be returned.  List of schedules.  To get a realtime prediction instead of the scheduled times, use `/predictions`.  A schedule is the arrival drop off (`/data/{index}/attributes/drop_off_type`) time (`/data/{index}/attributes/arrival_time`) and departure pick up (`/data/{index}/attributes/pickup_type`) time (`/data/{index}/attributes/departure_time`) to/from a stop (`/data/{index}/relationships/stop/data/id`) at a given sequence (`/data/{index}/attributes/stop_sequence`) along a trip (`/data/{index}/relationships/trip/data/id`) going in a direction (`/data/{index}/attributes/direction_id`) on a route (`/data/{index}/relationships/route/data/id`) when the trip is following a service (`/data/{index}/relationships/service/data/id`) to determine when it is active.  See [GTFS `stop_times.txt`](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stop_timestxt) for base specification.   ## When a vehicle is scheduled to be at a stop  `/schedules?filter[stop]=STOP_ID`  ## The schedule for one route  `/schedules?filter[route]=ROUTE_ID`  ### When a route is open  Query for the `first` and `last` stops on the route.  `/schedules?filter[route]=ROUTE_ID&filter[stop_sequence]=first,last`  ## The schedule for a whole trip  `/schedule?filter[trip]=TRIP_ID`  

  ### Parameters

  - `connection` (MBTA.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"page[offset]"` (integer()): Offset (0-based) of first element in the page
    - `:"page[limit]"` (integer()): Max number of elements to return
    - `:sort` (String.t): Results can be [sorted](http://jsonapi.org/format/#fetching-sorting) by the id or any `/data/{index}/attributes` key.  | JSON pointer | Direction | `sort`     | |--------------|-----------|------------| | `/data/{index}/attributes/arrival_time` | ascending | `arrival_time` | | `/data/{index}/attributes/arrival_time` | descending | `-arrival_time` | | `/data/{index}/attributes/departure_time` | ascending | `departure_time` | | `/data/{index}/attributes/departure_time` | descending | `-departure_time` | | `/data/{index}/attributes/direction_id` | ascending | `direction_id` | | `/data/{index}/attributes/direction_id` | descending | `-direction_id` | | `/data/{index}/attributes/drop_off_type` | ascending | `drop_off_type` | | `/data/{index}/attributes/drop_off_type` | descending | `-drop_off_type` | | `/data/{index}/attributes/pickup_type` | ascending | `pickup_type` | | `/data/{index}/attributes/pickup_type` | descending | `-pickup_type` | | `/data/{index}/attributes/stop_headsign` | ascending | `stop_headsign` | | `/data/{index}/attributes/stop_headsign` | descending | `-stop_headsign` | | `/data/{index}/attributes/stop_sequence` | ascending | `stop_sequence` | | `/data/{index}/attributes/stop_sequence` | descending | `-stop_sequence` | | `/data/{index}/attributes/timepoint` | ascending | `timepoint` | | `/data/{index}/attributes/timepoint` | descending | `-timepoint` |  | `/data/{index}/attributes/arrival_time` if present, otherwise `/data/{index}/attributes/departure_time` | ascending | `time` | | `/data/{index}/attributes/arrival_time` if present, otherwise `/data/{index}/attributes/departure_time` | descending | `-time` |  
    - `:"fields[schedule]"` (String.t): Fields to include with the response. Multiple fields **MUST** be a comma-separated (U+002C COMMA, \",\") list.  Note that fields can also be selected for included data types: see the [V3 API Best Practices](https://www.mbta.com/developers/v3-api/best-practices) for an example. 
    - `:include` (String.t): Relationships to include.  * `stop` * `trip` * `prediction` * `route`  The value of the include parameter **MUST** be a comma-separated (U+002C COMMA, \",\") list of relationship paths. A relationship path is a dot-separated (U+002E FULL-STOP, \".\") list of relationship names. [JSONAPI \"include\" behavior](http://jsonapi.org/format/#fetching-includes)   
    - `:"filter[date]"` (Date.t): Filter schedule by date that they are active. The active date is the service date. Trips that begin between midnight and 3am are considered part of the previous service day. The format is ISO8601 with the template of YYYY-MM-DD.
    - `:"filter[direction_id]"` (String.t): Filter by direction of travel along the route. Must be used in conjuction with `filter[route]` to apply.  The meaning of `direction_id` varies based on the route. You can programmatically get the direction names from `/routes` `/data/{index}/attributes/direction_names` or `/routes/{id}` `/data/attributes/direction_names`.    
    - `:"filter[route_type]"` (String.t): Filter by route_type: https://developers.google.com/transit/gtfs/reference/routes-file.  Multiple `route_type` **MUST** be a comma-separated (U+002C COMMA, \",\") list.  Must be used in conjunction with another filter. 
    - `:"filter[min_time]"` (String.t): Time before which schedule should not be returned. To filter times after midnight use more than 24 hours. For example, min_time=24:00 will return schedule information for the next calendar day, since that service is considered part of the current service day. Additionally, min_time=00:00&max_time=02:00 will not return anything. The time format is HH:MM.
    - `:"filter[max_time]"` (String.t): Time after which schedule should not be returned. To filter times after midnight use more than 24 hours. For example, min_time=24:00 will return schedule information for the next calendar day, since that service is considered part of the current service day. Additionally, min_time=00:00&max_time=02:00 will not return anything. The time format is HH:MM.
    - `:"filter[route]"` (String.t): Filter by `/data/{index}/relationships/route/data/id`.  Multiple IDs **MUST** be a comma-separated (U+002C COMMA, \",\") list.   
    - `:"filter[stop]"` (String.t): Filter by `/data/{index}/relationships/stop/data/id`.  Multiple IDs **MUST** be a comma-separated (U+002C COMMA, \",\") list.  Parent station IDs are treated as though their child stops were also included.  
    - `:"filter[trip]"` (String.t): Filter by `/data/{index}/relationships/trip/data/id`.  Multiple IDs **MUST** be a comma-separated (U+002C COMMA, \",\") list.   
    - `:"filter[stop_sequence]"` (String.t): Filter by the index of the stop in the trip.  Symbolic values `first` and `last` can be used instead of numeric sequence number too. 

  ### Returns

  - `{:ok, MBTA.Model.Schedules.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec api_web_schedule_controller_index(Tesla.Env.client, keyword()) :: {:ok, MBTA.Model.Forbidden.t} | {:ok, MBTA.Model.Schedules.t} | {:ok, MBTA.Model.TooManyRequests.t} | {:ok, MBTA.Model.BadRequest.t} | {:error, Tesla.Env.t}
  def api_web_schedule_controller_index(connection, opts \\ []) do
    optional_params = %{
      :"page[offset]" => :query,
      :"page[limit]" => :query,
      :sort => :query,
      :"fields[schedule]" => :query,
      :include => :query,
      :"filter[date]" => :query,
      :"filter[direction_id]" => :query,
      :"filter[route_type]" => :query,
      :"filter[min_time]" => :query,
      :"filter[max_time]" => :query,
      :"filter[route]" => :query,
      :"filter[stop]" => :query,
      :"filter[trip]" => :query,
      :"filter[stop_sequence]" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/schedules")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {429, MBTA.Model.TooManyRequests},
      {403, MBTA.Model.Forbidden},
      {400, MBTA.Model.BadRequest},
      {200, MBTA.Model.Schedules}
    ])
  end
end
