connection: "meydan_vertica"

# include all the views
include: "/views/**/*.view"

datagroup: meydan_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: meydan_project_default_datagroup

access_grant: can_view_sales_data {
  user_attribute: regions_user_attribute
  allowed_values: ["East"]
}

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
#   required_access_grants: [can_view_sales_data]
#   access_filter: {field: store_dimension.store_region
#     user_attribute: regions_user_attribute } # this will let Meydan see only East region
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
      FULL OUTER join store.store_sales_fact on  store_orders_fact.store_key=store.store_sales_fact.store_key
      {% else %}
      LEFT JOIN store.store_sales_fact on store_dimension.store_key=store.store_sales_fact.store_key
      {% endif %}    ;;
      type: full_outer
      relationship: one_to_many
  }
}

explore: store_orders_fact_derived_table {
  view_name: store_orders_fact_derived_table
}

explore: data_from_spreadsheet {
  persist_for: "24 hours"
  view_name: data_from_spreadsheet
}
