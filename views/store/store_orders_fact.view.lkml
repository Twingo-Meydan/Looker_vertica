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

  dimension: product_version {
    type: number
    sql: ${TABLE}.product_version ;;
  }

  measure: quantity_delivered {
    type: number
    sql: ${TABLE}.quantity_delivered ;;
  }

  measure: quantity_in_stock {
    type: number
    sql: ${TABLE}.quantity_in_stock ;;
  }

  measure: quantity_ordered {
    type: number
    sql: ${TABLE}.quantity_ordered ;;
  }

  dimension: reorder_level {
    type: number
    sql: ${TABLE}.reorder_level ;;
  }

  dimension: shipper_name {
    type: string
    sql: ${TABLE}.shipper_name ;;
  }

  measure: shipping_cost {
    type: number
    sql: ${TABLE}.shipping_cost ;;
  }

  dimension: store_key {
    type: number
    sql: ${TABLE}.store_key ;;
  }

  measure: total_order_cost {
    type: number
    sql: ${TABLE}.total_order_cost ;;
  }

  measure: unit_price {
    type: number
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

  dimension: is_ytd {
    type: yesno
    group_label: "Date Restrictions"
    label: "Is YTD?"
    view_label: "Dynamic Grouping & Time Comparisons"
    sql:
    MONTH(${TABLE}.date_ordered_raw) < MONTH(CURRENT_TIMESTAMP)
    OR
    (MONTH(${TABLE}.date_ordered_raw) = MONTH(CURRENT_TIMESTAMP)
    AND
    DAY(${TABLE}.date_ordered_raw) <= DAY(CURRENT_TIMESTAMP))
    ;;
  }

  measure: total_sales_ytd {
    type: sum
    sql: ${TABLE}.total_order_cost;;
    filters: {
      field: is_ytd
      value: "yes"
    }
    label: "Sales Year-to-Date"
  }

}
