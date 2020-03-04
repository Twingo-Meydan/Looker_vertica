view: warehouse_dimension {
  sql_table_name: public.warehouse_dimension ;;

  dimension: warehouse_address {
    type: string
    sql: ${TABLE}.warehouse_address ;;
  }

  dimension: warehouse_city {
    type: string
    sql: ${TABLE}.warehouse_city ;;
  }

  dimension: warehouse_key {
    type: number
    sql: ${TABLE}.warehouse_key ;;
  }

  dimension: warehouse_name {
    type: string
    sql: ${TABLE}.warehouse_name ;;
  }

  dimension: warehouse_region {
    type: string
    sql: ${TABLE}.warehouse_region ;;
  }

  dimension: warehouse_state {
    type: string
    sql: ${TABLE}.warehouse_state ;;
  }

  measure: count {
    type: count
    drill_fields: [warehouse_name]
  }
}
