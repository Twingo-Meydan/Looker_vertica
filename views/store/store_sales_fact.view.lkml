view: store_sales_fact {
  sql_table_name: store.store_sales_fact ;;

  measure: cost_dollar_amount {
    type: number
    sql: ${TABLE}.cost_dollar_amount ;;
  }

  dimension: customer_key {
    type: number
    sql: ${TABLE}.customer_key ;;
  }

  dimension: date_key {
    type: number
    sql: ${TABLE}.date_key ;;
  }

  dimension: employee_key {
    type: number
    sql: ${TABLE}.employee_key ;;
  }

  measure: gross_profit_dollar_amount {
    type: number
    sql: ${TABLE}.gross_profit_dollar_amount ;;
  }

  dimension: pos_transaction_number {
    type: number
    sql: ${TABLE}.pos_transaction_number ;;
  }

  dimension: product_key {
    type: number
    sql: ${TABLE}.product_key ;;
  }

  dimension: product_version {
    type: number
    sql: ${TABLE}.product_version ;;
  }

  dimension: promotion_key {
    type: number
    sql: ${TABLE}.promotion_key ;;
  }

  measure: sum_of_sales_dollar_amount {
    type: sum
    label: "sum of sales"
    sql: ${TABLE}.sales_dollar_amount ;;
    value_format: "$0.00,,,\" B\""
  }

# ask how the filter can be pointing to another dimention
  measure: total_sales_dollar_ytd {
    type: sum
    sql: ${TABLE}.sales_dollar_amount;;
#     filters: {
#       field:  ${date_dimension}.is_ytd
#       value: "yes"
#     }
    value_format: "$0.00,,,\" B\""
    label: "Sales Year-to-Date"
  }

  measure: sum_sales_quantity {
    type: sum
    sql: ${TABLE}.sales_quantity ;;
  }

  dimension: store_key {
    type: number
    sql: ${TABLE}.store_key ;;
  }

  dimension: tender_type {
    type: string
    sql: ${TABLE}.tender_type ;;
  }

  dimension_group: transaction {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.transaction_time ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

}
