connection: "vertica"

# include all the views
include: "*.view"
include: "*.dashboard.lookml"



datagroup: vertica_data_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: vertica_data_default_datagroup

explore: customer_dimension {}

explore: date_dimension {}

explore: product_dimension {}


explore: store_dimension{
  join: store_orders_fact {
    type: left_outer
    sql_on: ${store_dimension.store_key}=${store_orders_fact.store_key} ;;
    relationship: many_to_one

  }
}

explore: store_orders_fact {
  join: product_dimension {
    type: left_outer
    sql_on: ${product_dimension.product_key}=${store_orders_fact.product_key} ;;
    relationship: one_to_many
  }

}
