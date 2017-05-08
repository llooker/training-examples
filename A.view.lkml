view: a {
sql_table_name: orders ;;

dimension: id {}

dimension: b_id {
  sql: ${b.id} ;;
}

}
