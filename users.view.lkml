view: users {
  sql_table_name: demo_db.users ;;

  filter: state_name {
  }

  # example of templated filter on a measure

  measure: state_count {
    type: sum
    sql: CASE WHEN {% condition state_name%} ${state} {% endcondition %} THEN 1 ELSE 0 END ;;
  }

  # example of templated filter on a dimension

  dimension: state_compare {
    type: string
    sql: CASE WHEN {% condition state_name %} ${state} {% endcondition %} THEN ${city} ELSE 'All other states' END  ;;
  }

  # original fields

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: number
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
