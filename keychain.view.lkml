view: keychain {
  sql_table_name: public.keychain ;;

  dimension: accesskey {
    type: string
    sql: ${TABLE}.accesskey ;;
  }

  dimension: awsregion {
    type: string
    sql: ${TABLE}.awsregion ;;
  }

  dimension: secretaccesskey {
    type: string
    sql: ${TABLE}.secretaccesskey ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
