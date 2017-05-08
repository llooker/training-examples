view: a {
sql_table_name: orders ;;

dimension: id_view_a {}

dimension: id_view_b {
  sql: ${b.id_view_b} ;;
}

}
