view: ra {
  sql_table_name: public.ra ;;

  dimension: assault {
    type: number
    sql: ${TABLE}.assault ;;
  }

  dimension: murder {
    type: number
    sql: ${TABLE}.murder ;;
  }

  dimension: rape {
    type: number
    sql: ${TABLE}.rape ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: urbanpop {
    type: number
    sql: ${TABLE}.urbanpop ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
