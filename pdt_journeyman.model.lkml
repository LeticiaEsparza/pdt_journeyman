connection: "postgres-databasesme"

# include all the views
include: "*.view"

datagroup: pdt_padawan_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: pdt_padawan_default_datagroup

explore: ra {}
