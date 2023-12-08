# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Api.Stop do
  @moduledoc """
  API calls for all endpoints tagged `Stop`.
  """

  alias MBTA.Connection
  import MBTA.RequestBuilder

  @doc """
  List stops.  ## Accessibility  Wheelchair boarding (`/data/{index}/attributes/wheelchair_boarding`) corresponds to [GTFS wheelchair_boarding](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt). The MBTA handles parent station inheritance itself, so value can be treated simply:  | Value | Meaning                                       | |-------|-----------------------------------------------| | `0`   | No Information                                | | `1`   | Accessible (if trip is wheelchair accessible) | | `2`   | Inaccessible                                  |   ## Location  ### World  Use `/data/{index}/attributes/latitude` and `/data/{index}/attributes/longitude` to get the location of a stop.  ### Entrance  The stop may be inside a station.  If `/data/{index}/relationships/parent_station/data/id` is present, you should look up the parent station (`/stops/{parent_id}`) and use its location to give direction first to the parent station and then route from there to the stop.    ### Nearby  The `filter[latitude]` and `filter[longitude]` can be used together to find any stops near that latitude and longitude.  The distance is in degrees as if latitude and longitude were on a flat 2D plane and normal Pythagorean distance was calculated.  Over the region MBTA serves, `0.02` degrees is approximately `1` mile. How close is considered nearby, is controlled by `filter[radius]`, which default to `0.01` degrees (approximately a half mile). 

  ### Parameters

  - `connection` (MBTA.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"page[offset]"` (integer()): Offset (0-based) of first element in the page
    - `:"page[limit]"` (integer()): Max number of elements to return
    - `:sort` (String.t): Results can be [sorted](http://jsonapi.org/format/#fetching-sorting) by the id or any `/data/{index}/attributes` key. Sorting by distance requires `filter[latitude]` and `filter[longitude]` to be set. Assumes ascending; may be prefixed with '-' for descending.  | JSON pointer | Direction | `sort`     | |--------------|-----------|------------| | `/data/{index}/attributes/address` | ascending | `address` | | `/data/{index}/attributes/address` | descending | `-address` | | `/data/{index}/attributes/at_street` | ascending | `at_street` | | `/data/{index}/attributes/at_street` | descending | `-at_street` | | `/data/{index}/attributes/description` | ascending | `description` | | `/data/{index}/attributes/description` | descending | `-description` | | `/data/{index}/attributes/latitude` | ascending | `latitude` | | `/data/{index}/attributes/latitude` | descending | `-latitude` | | `/data/{index}/attributes/location_type` | ascending | `location_type` | | `/data/{index}/attributes/location_type` | descending | `-location_type` | | `/data/{index}/attributes/longitude` | ascending | `longitude` | | `/data/{index}/attributes/longitude` | descending | `-longitude` | | `/data/{index}/attributes/municipality` | ascending | `municipality` | | `/data/{index}/attributes/municipality` | descending | `-municipality` | | `/data/{index}/attributes/name` | ascending | `name` | | `/data/{index}/attributes/name` | descending | `-name` | | `/data/{index}/attributes/on_street` | ascending | `on_street` | | `/data/{index}/attributes/on_street` | descending | `-on_street` | | `/data/{index}/attributes/platform_code` | ascending | `platform_code` | | `/data/{index}/attributes/platform_code` | descending | `-platform_code` | | `/data/{index}/attributes/platform_name` | ascending | `platform_name` | | `/data/{index}/attributes/platform_name` | descending | `-platform_name` | | `/data/{index}/attributes/vehicle_type` | ascending | `vehicle_type` | | `/data/{index}/attributes/vehicle_type` | descending | `-vehicle_type` | | `/data/{index}/attributes/wheelchair_boarding` | ascending | `wheelchair_boarding` | | `/data/{index}/attributes/wheelchair_boarding` | descending | `-wheelchair_boarding` |  | Distance to (`/data/{index}/attributes/latitude`, `/data/{index}/attributes/longitude`) | ascending | `distance` | | Distance to (`/data/{index}/attributes/latitude`, `/data/{index}/attributes/longitude`) | descending | `-distance` |  
    - `:"fields[stop]"` (String.t): Fields to include with the response. Multiple fields **MUST** be a comma-separated (U+002C COMMA, \",\") list.  Note that fields can also be selected for included data types: see the [V3 API Best Practices](https://www.mbta.com/developers/v3-api/best-practices) for an example. 
    - `:include` (String.t): Relationships to include.  * `child_stops` * `connecting_stops` * `facilities` * `parent_station` * `route`  The value of the include parameter **MUST** be a comma-separated (U+002C COMMA, \",\") list of relationship paths. A relationship path is a dot-separated (U+002E FULL-STOP, \".\") list of relationship names. [JSONAPI \"include\" behavior](http://jsonapi.org/format/#fetching-includes)  Note that `route` can only be included if `filter[route]` is present and has exactly one `/data/{index}/relationships/route/data/id`. 
    - `:"filter[date]"` (Date.t): Filter by date when stop is in use. Will be ignored unless filter[route] is present. If filter[service] is present, this filter will be ignored. The active date is the service date. Trips that begin between midnight and 3am are considered part of the previous service day. The format is ISO8601 with the template of YYYY-MM-DD.
    - `:"filter[direction_id]"` (String.t): Filter by direction of travel along the route. Must be used in conjuction with `filter[route]` to apply.  The meaning of `direction_id` varies based on the route. You can programmatically get the direction names from `/routes` `/data/{index}/attributes/direction_names` or `/routes/{id}` `/data/attributes/direction_names`.    
    - `:"filter[latitude]"` (String.t): Latitude in degrees North in the [WGS-84](https://en.wikipedia.org/wiki/World_Geodetic_System#A_new_World_Geodetic_System:_WGS.C2.A084) coordinate system to search `filter[radius]` degrees around with `filter[longitude]`. 
    - `:"filter[longitude]"` (String.t): Longitude in degrees East in the [WGS-84](https://en.wikipedia.org/wiki/World_Geodetic_System#Longitudes_on_WGS.C2.A084) coordinate system to search `filter[radius]` degrees around with `filter[latitude]`. 
    - `:"filter[radius]"` (float()): The distance is in degrees as if latitude and longitude were on a flat 2D plane and normal Pythagorean distance was calculated.  Over the region MBTA serves, `0.02` degrees is approximately `1` mile. Defaults to `0.01` degrees (approximately a half mile). 
    - `:"filter[id]"` (String.t): Filter by `/data/{index}/id` (the stop ID). Multiple `/data/{index}/id` **MUST** be a comma-separated (U+002C COMMA, \",\") list. 
    - `:"filter[route_type]"` (String.t): Filter by route_type: https://developers.google.com/transit/gtfs/reference/routes-file.  Multiple `route_type` **MUST** be a comma-separated (U+002C COMMA, \",\") list.   
    - `:"filter[route]"` (String.t): Filter by `/data/{index}/relationships/route/data/id`.  Multiple IDs **MUST** be a comma-separated (U+002C COMMA, \",\") list.   
    - `:"filter[service]"` (String.t): Filter by service_id for which stop is in use. Multiple service_ids **MUST** be a comma-separated (U+002C COMMA, \",\") list. 
    - `:"filter[location_type]"` (String.t): Filter by location_type https://github.com/mbta/gtfs-documentation/blob/master/reference/gtfs.md#stopstxt. Multiple location_type **MUST** be a comma-separated (U+002C COMMA, \",\") list. 

  ### Returns

  - `{:ok, MBTA.Model.Stops.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec api_web_stop_controller_index(Tesla.Env.client, keyword()) :: {:ok, MBTA.Model.Forbidden.t} | {:ok, MBTA.Model.Stops.t} | {:ok, MBTA.Model.TooManyRequests.t} | {:ok, MBTA.Model.BadRequest.t} | {:error, Tesla.Env.t}
  def api_web_stop_controller_index(connection, opts \\ []) do
    optional_params = %{
      :"page[offset]" => :query,
      :"page[limit]" => :query,
      :sort => :query,
      :"fields[stop]" => :query,
      :include => :query,
      :"filter[date]" => :query,
      :"filter[direction_id]" => :query,
      :"filter[latitude]" => :query,
      :"filter[longitude]" => :query,
      :"filter[radius]" => :query,
      :"filter[id]" => :query,
      :"filter[route_type]" => :query,
      :"filter[route]" => :query,
      :"filter[service]" => :query,
      :"filter[location_type]" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/stops")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {429, MBTA.Model.TooManyRequests},
      {403, MBTA.Model.Forbidden},
      {400, MBTA.Model.BadRequest},
      {200, MBTA.Model.Stops}
    ])
  end

  @doc """
  Detail for a specific stop.  ## Accessibility  Wheelchair boarding (`/data/attributes/wheelchair_boarding`) corresponds to [GTFS wheelchair_boarding](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt). The MBTA handles parent station inheritance itself, so value can be treated simply:  | Value | Meaning                                       | |-------|-----------------------------------------------| | `0`   | No Information                                | | `1`   | Accessible (if trip is wheelchair accessible) | | `2`   | Inaccessible                                  |   ## Location  ### World  Use `/data/attributes/latitude` and `/data/attributes/longitude` to get the location of a stop.  ### Entrance  The stop may be inside a station.  If `/data/relationships/parent_station/data/id` is present, you should look up the parent station (`/stops/{parent_id}`) and use its location to give direction first to the parent station and then route from there to the stop.   

  ### Parameters

  - `connection` (MBTA.Connection): Connection to server
  - `id` (String.t): Unique identifier for stop
  - `opts` (keyword): Optional parameters
    - `:"fields[stop]"` (String.t): Fields to include with the response. Multiple fields **MUST** be a comma-separated (U+002C COMMA, \",\") list.  Note that fields can also be selected for included data types: see the [V3 API Best Practices](https://www.mbta.com/developers/v3-api/best-practices) for an example. 
    - `:include` (String.t): Relationships to include.  * `child_stops` * `connecting_stops` * `facilities` * `parent_station`  The value of the include parameter **MUST** be a comma-separated (U+002C COMMA, \",\") list of relationship paths. A relationship path is a dot-separated (U+002E FULL-STOP, \".\") list of relationship names. [JSONAPI \"include\" behavior](http://jsonapi.org/format/#fetching-includes)   

  ### Returns

  - `{:ok, MBTA.Model.Stop.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec api_web_stop_controller_show(Tesla.Env.client, String.t, keyword()) :: {:ok, MBTA.Model.NotAcceptable.t} | {:ok, MBTA.Model.Forbidden.t} | {:ok, MBTA.Model.TooManyRequests.t} | {:ok, MBTA.Model.Stop.t} | {:ok, MBTA.Model.NotFound.t} | {:ok, MBTA.Model.BadRequest.t} | {:error, Tesla.Env.t}
  def api_web_stop_controller_show(connection, id, opts \\ []) do
    optional_params = %{
      :"fields[stop]" => :query,
      :include => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/stops/#{id}")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {429, MBTA.Model.TooManyRequests},
      {406, MBTA.Model.NotAcceptable},
      {404, MBTA.Model.NotFound},
      {403, MBTA.Model.Forbidden},
      {400, MBTA.Model.BadRequest},
      {200, MBTA.Model.Stop}
    ])
  end
end
