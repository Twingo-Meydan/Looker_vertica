view: customer_dimension {
  sql_table_name: public.customer_dimension ;;

  dimension: annual_income {
    type: number
    sql: ${TABLE}.annual_income ;;
  }

  dimension: customer_address {
    type: string
    sql: ${TABLE}.customer_address ;;
  }

  dimension: customer_age {
    type: number
    sql: ${TABLE}.customer_age ;;
  }

  dimension: customer_city {
    type: string
    sql: ${TABLE}.customer_city ;;
  }

  dimension: customer_gender {
    type: string
    sql: ${TABLE}.customer_gender ;;
  }

  dimension: customer_key {
    type: number
    sql: ${TABLE}.customer_key ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: customer_region {
    type: string
    sql: ${TABLE}.customer_region ;;
  }

  dimension_group: customer_since {
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
    sql: ${TABLE}.customer_since ;;
  }

  dimension: customer_state {
    type: string
    sql: ${TABLE}.customer_state ;;
  }

  dimension: customer_type {
    type: string
    sql: ${TABLE}.customer_type ;;
  }

  dimension: deal_size {
    type: number
    sql: ${TABLE}.deal_size ;;
  }

  dimension: deal_stage {
    type: string
    sql: ${TABLE}.deal_stage ;;
  }

  dimension: household_id {
    type: number
    sql: ${TABLE}.household_id ;;
  }

  dimension: largest_bill_amount {
    type: number
    sql: ${TABLE}.largest_bill_amount ;;
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

  dimension: marital_status {
    type: string
    sql: ${TABLE}.marital_status ;;
  }

  dimension: number_of_children {
    type: number
    sql: ${TABLE}.number_of_children ;;
  }

  dimension: occupation {
    type: string
    sql: ${TABLE}.occupation ;;
  }

  dimension: store_membership_card {
    type: number
    sql: ${TABLE}.store_membership_card ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name]
  }
}
