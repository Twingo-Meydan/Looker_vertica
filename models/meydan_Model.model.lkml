connection: "meydan_vertica"

# include all the views
include: "/views/**/*.view"

datagroup: meydan_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: meydan_project_default_datagroup

explore: store_orders_fact {
  label: "Orders"
  join: employee_dimension {
  type: left_outer
  sql_on: ${employee_dimension.employee_key} = ${store_orders_fact.employee_key}  ;;
    relationship: many_to_one
  }

}

explore: store_sales_fact {
  label:"Sales"
  join: date_dimension {
    type: left_outer
    sql_on: ${date_dimension.date_key} = ${store_sales_fact.date_key}  ;;
    relationship: many_to_one
  }

  join: customer_dimension {
    type: left_outer
    sql_on: ${customer_dimension.customer_key} = ${store_sales_fact.customer_key} ;;
    relationship: many_to_one
  }

  join: store_dimension {
    type: left_outer
    sql_on: ${store_dimension.store_key} = ${store_sales_fact.store_key} ;;
    relationship: many_to_one
  }
}

explore: sales_orders {
  label: "Sales Orders"
  view_name: store_dimension
  join: store_orders_fact {
    type: left_outer
    sql_on: ${store_dimension.store_key}=${store_orders_fact.store_key} ;;
    relationship: one_to_many
  }

  join: store_sales_fact
  {
    sql:{% if store_orders_fact._in_query %}
      FULL OUTER join store.store_sales_fact on  store.store_orders_fact.store_key=store.store_sales_fact.store_key
      {% else %}
      LEFT JOIN store.store_sales_fact on store.store_dimension.store_key=store.store_sales_fact.store_key
      {% endif %}    ;;
      type: full_outer
      relationship: one_to_many
  }
}
