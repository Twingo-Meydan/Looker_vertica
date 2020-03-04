view: promotion_dimension {
  sql_table_name: public.promotion_dimension ;;

  dimension: ad_media_name {
    type: string
    sql: ${TABLE}.ad_media_name ;;
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}.ad_type ;;
  }

  dimension: coupon_type {
    type: string
    sql: ${TABLE}.coupon_type ;;
  }

  dimension: display_provider {
    type: string
    sql: ${TABLE}.display_provider ;;
  }

  dimension: display_type {
    type: string
    sql: ${TABLE}.display_type ;;
  }

  dimension: price_reduction_type {
    type: string
    sql: ${TABLE}.price_reduction_type ;;
  }

  dimension_group: promotion_begin {
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
    sql: ${TABLE}.promotion_begin_date ;;
  }

  dimension: promotion_cost {
    type: number
    sql: ${TABLE}.promotion_cost ;;
  }

  dimension_group: promotion_end {
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
    sql: ${TABLE}.promotion_end_date ;;
  }

  dimension: promotion_key {
    type: number
    sql: ${TABLE}.promotion_key ;;
  }

  dimension: promotion_media_type {
    type: string
    sql: ${TABLE}.promotion_media_type ;;
  }

  dimension: promotion_name {
    type: string
    sql: ${TABLE}.promotion_name ;;
  }

  measure: count {
    type: count
    drill_fields: [promotion_name, ad_media_name]
  }
}
