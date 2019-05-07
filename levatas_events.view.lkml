view: levatas_events {
  derived_table: {
    sql: SELECT '2020 Ryder Cup' AS Event, 43.8509549 AS Lat, -87.7352017 AS Long
      UNION ALL
      SELECT '2020 PGA Championship' AS Event, 37.724772 AS Lat, -122.493652 AS Long
      UNION ALL
      SELECT '2019 PGA Championship' AS Event, 40.7457789 AS Lat, -73.4550984 AS Long
      UNION ALL
      SELECT '2020 Kitchenaid' AS Event, 42.119595 AS Lat, -86.460219 AS Long
      UNION ALL
      SELECT '2019 KPMG Womens' AS Event, 44.833733 AS Lat, -93.590716 AS Long
      UNION ALL
      SELECT '22020 KPMG Womens' AS Event, 40.011636 AS Lat, -75.409017 AS Long
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.long ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${long} ;;
  }

  parameter: event_parameter {
    type: string
    allowed_value: {
      value: "2020 Ryder Cup"
    }
    allowed_value: {
      value: "2020 PGA Championship"
    }
    allowed_value: {
      value: "2019 PGA Championship"
    }
    allowed_value: {
      value: "2020 Kitchenaid"
    }
    allowed_value: {
      value: "2019 KPMG Womens"
    }
    allowed_value: {
      value: "22020 KPMG Womens"
    }
    allowed_value: {
      value: "All Events"
    }

  }

  dimension: dynamic_start_location {
    type: location
    sql_latitude:
                  {% if event_parameter._parameter_value == "'2020 Ryder Cup'"  %}
                      43.8509549
                  {% elsif event_parameter._parameter_value == "'2020 PGA Championship'"  %}
                      37.724772
                  {% elsif event_parameter._parameter_value == "'2019 PGA Championship'"  %}
                      40.7457789
                  {% elsif event_parameter._parameter_value == "'2020 Kitchenaid'"  %}
                      42.119595
                  {% elsif event_parameter._parameter_value == "'2019 KPMG Womens'"  %}
                      44.833733
                  {% elsif event_parameter._parameter_value == "'22020 KPMG Womens'"  %}
                      40.011636
                  {% else %}
                      ${lat}
                  {% endif %}

    ;;
    sql_longitude:
                  {% if event_parameter._parameter_value == "'2020 Ryder Cup'"  %}
                      -87.7352017
                  {% elsif event_parameter._parameter_value == "'2020 PGA Championship'"  %}
                      -122.493652
                  {% elsif event_parameter._parameter_value == "'2019 PGA Championship'"  %}
                      -73.4550984
                  {% elsif event_parameter._parameter_value == "'2020 Kitchenaid'"  %}
                      -86.460219
                  {% elsif event_parameter._parameter_value == "'2019 KPMG Womens'"  %}
                      -93.590716
                  {% elsif event_parameter._parameter_value == "'22020 KPMG Womens'"  %}
                      -75.409017
                  {% else %}
                      ${long}
                  {% endif %}

    ;;
  }

  dimension: dynamic_distance {
    type: distance
    start_location_field: dynamic_start_location
    end_location_field: location
    units: miles
  }

  set: detail {
    fields: [event, lat, long]
  }
}
