view: lab_2_pdt {
  derived_table: {
    sql: SELECT
        ra.state  AS state,
        AVG(ra.murder ) AS murder_average,
        MAX(ra.murder ) AS murder_max,
        MIN(ra.murder ) AS murder_min,
        COALESCE(SUM(ra.murder ), 0) AS murder_sum,
        current_timestamp

      FROM public.ra  AS ra

      GROUP BY 1
      ORDER BY 2 DESC
       ;;
      sql_trigger_value: SELECT DATE_PART('hour', NOW()) ;;
      indexes: ["state"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: murder_average {
    type: number
    sql: ${TABLE}.murder_average ;;
  }

  dimension: murder_max {
    type: number
    sql: ${TABLE}.murder_max ;;
  }

  dimension: murder_min {
    type: number
    sql: ${TABLE}.murder_min ;;
  }

  dimension: murder_sum {
    type: number
    sql: ${TABLE}.murder_sum ;;
  }

  dimension: current_timestamp {
    type: string
    sql: ${TABLE}.current_timestamp ;;
  }

  set: detail {
    fields: [state, murder_average, murder_max, murder_min, murder_sum]
  }
}
