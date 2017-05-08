connection: "thelook"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: testing_from {
  from: b
  join: a {
    sql_on: ${a.b_id} = ${testing_from.id} ;;
    relationship: one_to_one
  }
}
