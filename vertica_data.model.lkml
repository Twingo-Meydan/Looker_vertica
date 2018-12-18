connection: "vertica"

# include all the views
include: "*.view"
include: "*.dashboard.lookml"



datagroup: vertica_data_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: vertica_data_default_datagroup



explore: store_orders_fact {
  view_label: "Orders"
  join: product_dimension {
    view_label: "Products"
    type: left_outer
    sql_on: ${product_dimension.product_key}=${store_orders_fact.product_key} ;;
    relationship: one_to_many
  }
  join: store_dimension {
    view_label: "Stores"
    type: left_outer
    sql_on: ${store_dimension.store_key}=${store_orders_fact.store_key} ;;
    relationship: one_to_many
  }
  join: date_dimension {
    view_label: "Order Dates Dimension"
    type: inner
    sql_on: ${date_dimension.date_date}=${store_orders_fact.date_ordered_date} ;;
    relationship: one_to_one
  }
}
