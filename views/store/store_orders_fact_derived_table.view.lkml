 view: store_orders_fact_derived_table {
  derived_table: {
    sql: select date_ordered, sum(quantity_ordered) as quantity_ordered from store.store_orders_fact
          where
          {% condition date_ordered %} date_ordered {% endcondition %}
          group by date_ordered
      ;;
  }

    filter: date_ordered {
      type: date
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

measure: total_order_qty {
  type: sum
  sql:  ${TABLE}.quantity_ordered;;
}

}
