view: store_orders_fact {
  sql_table_name: store.store_orders_fact ;;

  dimension_group: date_delivered {
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
    sql: ${TABLE}.date_delivered ;;
  }

  dimension_group: date_ordered {
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
    drill_fields: [date_ordered_week,date_ordered_month,date_ordered_quarter,date_ordered_year]
    sql: ${TABLE}.date_ordered ;;
  }

  dimension_group: date_shipped {
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
    sql: ${TABLE}.date_shipped ;;
  }

  dimension: employee_key {
    type: number
    sql: ${TABLE}.employee_key ;;
  }

  dimension_group: expected_delivery {
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
    sql: ${TABLE}.expected_delivery_date ;;
  }

  dimension: order_number {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_number ;;
  }

  dimension: overstock_ceiling {
    type: number
    sql: ${TABLE}.overstock_ceiling ;;
  }

  dimension: product_key {
    type: number
    sql: ${TABLE}.product_key ;;
  }



  measure: quantity_delivered {
    type: sum
    sql: ${TABLE}.quantity_delivered ;;
  }

  measure: quantity_in_stock {
    type: sum
    sql: ${TABLE}.quantity_in_stock ;;
  }

  measure: quantity_ordered {
    type: sum
    sql: ${TABLE}.quantity_ordered ;;
  }

dimension: Order_cost {
  type: number
  sql:  ${TABLE}.total_order_cost ;;
}

  dimension: shipper_name {
    type: string
    sql: ${TABLE}.shipper_name ;;
  }

  measure: shipping_cost {
    type: sum
    sql: ${TABLE}.shipping_cost ;;
  }

  dimension: store_key {
    type: number
    sql: ${TABLE}.store_key ;;
  }

  measure: sum_total_order_cost {
    type: sum
    sql: ${TABLE}.total_order_cost ;;
  }

  measure: unit_price {
    type: sum
    sql: ${TABLE}.unit_price ;;
  }

  dimension: vendor_key {
    type: number
    sql: ${TABLE}.vendor_key ;;
  }

  measure: count {
    type: count
    drill_fields: [shipper_name]
  }

  measure: OrderCount {
    label: "Total Orders quantity"
    type: count_distinct
    drill_fields: [product_key]
    sql: ${order_number};;
  }



  dimension: category_description {
    type: string
    sql: public.product_dimension.category_description ;;
  }

measure: Avg_cost {
  label: "Profit"
  type: average
  sql: ${Order_cost};;

}

}
