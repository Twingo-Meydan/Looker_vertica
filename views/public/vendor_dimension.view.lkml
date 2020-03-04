view: vendor_dimension {
  sql_table_name: public.vendor_dimension ;;

  dimension: deal_size {
    type: number
    sql: ${TABLE}.deal_size ;;
  }

  dimension_group: last_deal_update {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_deal_update ;;
  }

  dimension: vendor_address {
    type: string
    sql: ${TABLE}.vendor_address ;;
  }

  dimension: vendor_city {
    type: string
    sql: ${TABLE}.vendor_city ;;
  }

  dimension: vendor_key {
    type: number
    sql: ${TABLE}.vendor_key ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: vendor_region {
    type: string
    sql: ${TABLE}.vendor_region ;;
  }

  dimension: vendor_state {
    type: string
    sql: ${TABLE}.vendor_state ;;
  }

  measure: count {
    type: count
    drill_fields: [vendor_name]
  }
}
