view: shipping_dimension {
  sql_table_name: public.shipping_dimension ;;

  dimension: ship_carrier {
    type: string
    sql: ${TABLE}.ship_carrier ;;
  }

  dimension: ship_mode {
    type: string
    sql: ${TABLE}.ship_mode ;;
  }

  dimension: ship_type {
    type: string
    sql: ${TABLE}.ship_type ;;
  }

  dimension: shipping_key {
    type: number
    sql: ${TABLE}.shipping_key ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
