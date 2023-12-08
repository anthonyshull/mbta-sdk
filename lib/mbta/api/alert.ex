# NOTE: This file is auto generated by OpenAPI Generator 7.1.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MBTA.Api.Alert do
  @moduledoc """
  API calls for all endpoints tagged `Alert`.
  """

  alias MBTA.Connection
  import MBTA.RequestBuilder

  @doc """
  List active and upcoming system alerts  An effect (enumerated in `/data/{index}/attributes/effect` and human-readable in `/data/{index}/attributes/service_effect`) on a provided service (facility, route, route type, stop and/or trip in `//data/{index}/attributes/informed_entity`) described by a banner (`/data/{index}/attributes/banner`), short header (`/data/{index}/attributes/short_header`), header `/data/{index}/attributes/header`, description (`/data/{index}/attributes/description`), image (`/data/{index}/attributes/image`), and image alternative text (`/data/{index}/attributes/image_alternative_text`) that is active for one or more periods(`/data/{index}/attributes/active_period`) caused by a cause (`/data/{index}/attribute/cause`) that somewhere in its lifecycle (enumerated in `/data/{index}/attributes/lifecycle` and human-readable in `/data/{index}/attributes/timeframe`).  See [GTFS Realtime `FeedMessage` `FeedEntity` `Alert`](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/reference.md#message-alert)  ## Descriptions  There are 7 descriptive attributes.  | JSON pointer                                | Usage                                                                           | |---------------------------------------------|---------------------------------------------------------------------------------| | `/data/{index}/attributes/banner`       | Display as alert across application/website                                     | | `/data/{index}/attributes/short_header` | When `/data/{index}/attributes/header` is too long to display               | | `/data/{index}/attributes/header`       | Used before showing and prepended to `/data/{index}/attributes/description` | | `/data/{index}/attributes/description`  | Used when user asks to expand alert.                                            | | `/data/{index}/attributes/image`        | URL to descriptive image.                                                       | | `/data/{index}/attributes/image_alternative_text`  | Text that describes image linked in url                              |  ## Effect  | JSON pointer                                  |                | |-----------------------------------------------|----------------| | `/data/{index}/attributes/effect`         | Enumerated     | | `/data/{index}/attributes/service_effect` | Human-readable |  ## Timeline  There are 3 timeline related attributes  | JSON pointer                                 | Description                                                                              | |----------------------------------------------|------------------------------------------------------------------------------------------| | `/data/{index}/attributes/active_period` | Exact Date/Time ranges alert is active                                                   | | `/data/{index}/attributes/lifecycle`     | Enumerated, machine-readable description of `/data/{index}/attributes/active_period` | | `/data/{index}/attributes/timeframe`     | Human-readable description of `/data/{index}/attributes/active_period`               |   ## Activities  Alerts are by default filtered to those where `/data/{index}/attributes/informed_entity/{informed_entity_index}/activities/{activity_index}` in one of BOARDEXITRIDE, as these cover most riders.  If you want all alerts without filtering by activity, you should use the special value `\"ALL\"`: `filter[activity]=ALL`.  ### Accessibility  The default activities cover if boarding, exiting, or riding is generally affected for all riders by the alert. If ONLY wheelchair using riders are affected, such as if a ramp, lift, or safety system for wheelchairs is affected, only the `\"USING_WHEELCHAIR\"` activity will be set. To cover wheelchair using rider, filter on the defaults and `\"USING_WHEELCHAIR\"`: `filter[activity]=USING_WHEELCHAIR,BOARD,EXIT,RIDE`.  Similarly for riders with limited mobility that need escalators, `\"USING_ESCALATOR\"` should be added to the defaults: `filter[activity]=USING_ESCALATOR,BOARD,EXIT,RIDE`.  

  ### Parameters

  - `connection` (MBTA.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"page[offset]"` (integer()): Offset (0-based) of first element in the page
    - `:"page[limit]"` (integer()): Max number of elements to return
    - `:sort` (String.t): Results can be [sorted](http://jsonapi.org/format/#fetching-sorting) by the id or any `/data/{index}/attributes` key. Assumes ascending; may be prefixed with '-' for descending  | JSON pointer | Direction | `sort`     | |--------------|-----------|------------| | `/data/{index}/attributes/active_period` | ascending | `active_period` | | `/data/{index}/attributes/active_period` | descending | `-active_period` | | `/data/{index}/attributes/banner` | ascending | `banner` | | `/data/{index}/attributes/banner` | descending | `-banner` | | `/data/{index}/attributes/cause` | ascending | `cause` | | `/data/{index}/attributes/cause` | descending | `-cause` | | `/data/{index}/attributes/created_at` | ascending | `created_at` | | `/data/{index}/attributes/created_at` | descending | `-created_at` | | `/data/{index}/attributes/description` | ascending | `description` | | `/data/{index}/attributes/description` | descending | `-description` | | `/data/{index}/attributes/effect` | ascending | `effect` | | `/data/{index}/attributes/effect` | descending | `-effect` | | `/data/{index}/attributes/effect_name` | ascending | `effect_name` | | `/data/{index}/attributes/effect_name` | descending | `-effect_name` | | `/data/{index}/attributes/header` | ascending | `header` | | `/data/{index}/attributes/header` | descending | `-header` | | `/data/{index}/attributes/image` | ascending | `image` | | `/data/{index}/attributes/image` | descending | `-image` | | `/data/{index}/attributes/image_alternative_text` | ascending | `image_alternative_text` | | `/data/{index}/attributes/image_alternative_text` | descending | `-image_alternative_text` | | `/data/{index}/attributes/informed_entity` | ascending | `informed_entity` | | `/data/{index}/attributes/informed_entity` | descending | `-informed_entity` | | `/data/{index}/attributes/lifecycle` | ascending | `lifecycle` | | `/data/{index}/attributes/lifecycle` | descending | `-lifecycle` | | `/data/{index}/attributes/service_effect` | ascending | `service_effect` | | `/data/{index}/attributes/service_effect` | descending | `-service_effect` | | `/data/{index}/attributes/severity` | ascending | `severity` | | `/data/{index}/attributes/severity` | descending | `-severity` | | `/data/{index}/attributes/short_header` | ascending | `short_header` | | `/data/{index}/attributes/short_header` | descending | `-short_header` | | `/data/{index}/attributes/timeframe` | ascending | `timeframe` | | `/data/{index}/attributes/timeframe` | descending | `-timeframe` | | `/data/{index}/attributes/updated_at` | ascending | `updated_at` | | `/data/{index}/attributes/updated_at` | descending | `-updated_at` | | `/data/{index}/attributes/url` | ascending | `url` | | `/data/{index}/attributes/url` | descending | `-url` |  
    - `:"fields[alert]"` (String.t): Fields to include with the response. Multiple fields **MUST** be a comma-separated (U+002C COMMA, \",\") list.  Note that fields can also be selected for included data types: see the [V3 API Best Practices](https://www.mbta.com/developers/v3-api/best-practices) for an example. 
    - `:include` (String.t): Relationships to include.  * `stops` * `routes` * `trips` * `facilities`  The value of the include parameter **MUST** be a comma-separated (U+002C COMMA, \",\") list of relationship paths. A relationship path is a dot-separated (U+002E FULL-STOP, \".\") list of relationship names. [JSONAPI \"include\" behavior](http://jsonapi.org/format/#fetching-includes)   
    - `:"filter[activity]"` (String.t): Filter to alerts for only those activities (`/data/{index}/attributes/informed_entity/activities/{activity_index}`) matching.  Multiple activities **MUST** be a comma-separated (U+002C COMMA, \",\") list.  An activity affected by an alert.  | Value                | Description                                                                                                                                                                                                                                                                       | |----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| | `\"BOARD\"`            | Boarding a vehicle. Any passenger trip includes boarding a vehicle and exiting from a vehicle.                                                                                                                                                                                    | | `\"BRINGING_BIKE\"`    | Bringing a bicycle while boarding or exiting.                                                                                                                                                                                                                                     | | `\"EXIT\"`             | Exiting from a vehicle (disembarking). Any passenger trip includes boarding a vehicle and exiting a vehicle.                                                                                                                                                                      | | `\"PARK_CAR\"`         | Parking a car at a garage or lot in a station.                                                                                                                                                                                                                                    | | `\"RIDE\"`             | Riding through a stop without boarding or exiting.. Not every passenger trip will include this -- a passenger may board at one stop and exit at the next stop.                                                                                                                    | | `\"STORE_BIKE\"`       | Storing a bicycle at a station.                                                                                                                                                                                                                                                   | | `\"USING_ESCALATOR\"`  | Using an escalator while boarding or exiting (should only be used for customers who specifically want to avoid stairs.)                                                                                                                                                           | | `\"USING_WHEELCHAIR\"` | Using a wheelchair while boarding or exiting. Note that this applies to something that specifically affects customers who use a wheelchair to board or exit; a delay should not include this as an affected activity unless it specifically affects customers using wheelchairs.  |   ## Special Values  * If the filter is not given OR it is empty, then defaults to [\"BOARD\", \"EXIT\", \"RIDE\"]. * If the value `\"ALL\"` is used then all alerts will be returned, not just those with the default activities.  ## Accessibility  The default activities cover if boarding, exiting, or riding is generally affected for all riders by the alert. If ONLY wheelchair using riders are affected, such as if a ramp, lift, or safety system for wheelchairs is affected, only the `\"USING_WHEELCHAIR\"` activity will be set. To cover wheelchair using rider, filter on the defaults and `\"USING_WHEELCHAIR\"`: `filter[activity]=USING_WHEELCHAIR,BOARD,EXIT,RIDE`.  Similarly for riders with limited mobility that need escalators, `\"USING_ESCALATOR\"` should be added to the defaults: `filter[activity]=USING_ESCALATOR,BOARD,EXIT,RIDE`.  
    - `:"filter[route_type]"` (String.t): Filter by route_type: https://developers.google.com/transit/gtfs/reference/routes-file.  Multiple `route_type` **MUST** be a comma-separated (U+002C COMMA, \",\") list.   
    - `:"filter[direction_id]"` (String.t): Filter by direction of travel along the route. Must be used in conjuction with `filter[route]` to apply.  The meaning of `direction_id` varies based on the route. You can programmatically get the direction names from `/routes` `/data/{index}/attributes/direction_names` or `/routes/{id}` `/data/attributes/direction_names`.    
    - `:"filter[route]"` (String.t): Filter by `/data/{index}/relationships/route/data/id`.  Multiple IDs **MUST** be a comma-separated (U+002C COMMA, \",\") list.   
    - `:"filter[stop]"` (String.t): Filter by `/data/{index}/relationships/stop/data/id`.  Multiple IDs **MUST** be a comma-separated (U+002C COMMA, \",\") list.  Parent station IDs are treated as though their child stops were also included.  
    - `:"filter[trip]"` (String.t): Filter by `/data/{index}/relationships/trip/data/id`.  Multiple IDs **MUST** be a comma-separated (U+002C COMMA, \",\") list.   
    - `:"filter[facility]"` (String.t): Filter by `/data/{index}/relationships/facility/data/id`.  Multiple IDs **MUST** be a comma-separated (U+002C COMMA, \",\") list.   
    - `:"filter[id]"` (String.t): Filter by multiple IDs. Multiple IDs **MUST** be a comma-separated (U+002C COMMA, \",\") list.
    - `:"filter[banner]"` (String.t): When combined with other filters, filters by alerts with or without a banner. **MUST** be \"true\" or \"false\". 
    - `:"filter[datetime]"` (String.t): Filter to alerts that are active at a given time (ISO8601 format).  Additionally, the string \"NOW\" can be used to filter to alerts that are currently active. 
    - `:"filter[lifecycle]"` (String.t): Filters by an alert's lifecycle. **MUST** be a comma-separated (U+002C COMMA, \",\") list. 
    - `:"filter[severity]"` (String.t): Filters alerts by list of severities. **MUST** be a comma-separated (U+002C COMMA, \",\") list.  Example: filter[severity]=3,4,10 returns alerts with severity levels 3, 4 and 10. 

  ### Returns

  - `{:ok, MBTA.Model.Alerts.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec api_web_alert_controller_index(Tesla.Env.client, keyword()) :: {:ok, MBTA.Model.Alerts.t} | {:ok, MBTA.Model.Forbidden.t} | {:ok, MBTA.Model.TooManyRequests.t} | {:ok, MBTA.Model.BadRequest.t} | {:error, Tesla.Env.t}
  def api_web_alert_controller_index(connection, opts \\ []) do
    optional_params = %{
      :"page[offset]" => :query,
      :"page[limit]" => :query,
      :sort => :query,
      :"fields[alert]" => :query,
      :include => :query,
      :"filter[activity]" => :query,
      :"filter[route_type]" => :query,
      :"filter[direction_id]" => :query,
      :"filter[route]" => :query,
      :"filter[stop]" => :query,
      :"filter[trip]" => :query,
      :"filter[facility]" => :query,
      :"filter[id]" => :query,
      :"filter[banner]" => :query,
      :"filter[datetime]" => :query,
      :"filter[lifecycle]" => :query,
      :"filter[severity]" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/alerts")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {429, MBTA.Model.TooManyRequests},
      {403, MBTA.Model.Forbidden},
      {400, MBTA.Model.BadRequest},
      {200, MBTA.Model.Alerts}
    ])
  end

  @doc """
  Show a particular alert by the alert's id  An effect (enumerated in `/data/attributes/effect` and human-readable in `/data/attributes/service_effect`) on a provided service (facility, route, route type, stop and/or trip in `//data/attributes/informed_entity`) described by a banner (`/data/attributes/banner`), short header (`/data/attributes/short_header`), header `/data/attributes/header`, description (`/data/attributes/description`), image (`/data/attributes/image`), and image alternative text (`/data/attributes/image_alternative_text`) that is active for one or more periods(`/data/attributes/active_period`) caused by a cause (`/data/attribute/cause`) that somewhere in its lifecycle (enumerated in `/data/attributes/lifecycle` and human-readable in `/data/attributes/timeframe`).  See [GTFS Realtime `FeedMessage` `FeedEntity` `Alert`](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/reference.md#message-alert)  ## Descriptions  There are 7 descriptive attributes.  | JSON pointer                                | Usage                                                                           | |---------------------------------------------|---------------------------------------------------------------------------------| | `/data/attributes/banner`       | Display as alert across application/website                                     | | `/data/attributes/short_header` | When `/data/attributes/header` is too long to display               | | `/data/attributes/header`       | Used before showing and prepended to `/data/attributes/description` | | `/data/attributes/description`  | Used when user asks to expand alert.                                            | | `/data/attributes/image`        | URL to descriptive image.                                                       | | `/data/attributes/image_alternative_text`  | Text that describes image linked in url                              |  ## Effect  | JSON pointer                                  |                | |-----------------------------------------------|----------------| | `/data/attributes/effect`         | Enumerated     | | `/data/attributes/service_effect` | Human-readable |  ## Timeline  There are 3 timeline related attributes  | JSON pointer                                 | Description                                                                              | |----------------------------------------------|------------------------------------------------------------------------------------------| | `/data/attributes/active_period` | Exact Date/Time ranges alert is active                                                   | | `/data/attributes/lifecycle`     | Enumerated, machine-readable description of `/data/attributes/active_period` | | `/data/attributes/timeframe`     | Human-readable description of `/data/attributes/active_period`               |  

  ### Parameters

  - `connection` (MBTA.Connection): Connection to server
  - `id` (String.t): Unique identifier for alert
  - `opts` (keyword): Optional parameters
    - `:"fields[alert]"` (String.t): Fields to include with the response. Multiple fields **MUST** be a comma-separated (U+002C COMMA, \",\") list.  Note that fields can also be selected for included data types: see the [V3 API Best Practices](https://www.mbta.com/developers/v3-api/best-practices) for an example. 
    - `:include` (String.t): Relationships to include.  * `stops` * `routes` * `trips` * `facilities`  The value of the include parameter **MUST** be a comma-separated (U+002C COMMA, \",\") list of relationship paths. A relationship path is a dot-separated (U+002E FULL-STOP, \".\") list of relationship names. [JSONAPI \"include\" behavior](http://jsonapi.org/format/#fetching-includes)   

  ### Returns

  - `{:ok, MBTA.Model.Alert.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec api_web_alert_controller_show(Tesla.Env.client, String.t, keyword()) :: {:ok, MBTA.Model.NotAcceptable.t} | {:ok, MBTA.Model.Forbidden.t} | {:ok, MBTA.Model.Alert.t} | {:ok, MBTA.Model.TooManyRequests.t} | {:ok, MBTA.Model.NotFound.t} | {:ok, MBTA.Model.BadRequest.t} | {:error, Tesla.Env.t}
  def api_web_alert_controller_show(connection, id, opts \\ []) do
    optional_params = %{
      :"fields[alert]" => :query,
      :include => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/alerts/#{id}")
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
      {200, MBTA.Model.Alert}
    ])
  end
end
