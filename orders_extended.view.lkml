include: "orders.view"
view: orders_extended {
 extends: [orders]
## filter determining time range for all "A" measures
  filter: time_a {
    type: date_time
  }

## flag for "A" measures to only include appropriate time range
  dimension: group_a {
    hidden: yes
    type: yesno
    sql: {% condition time_a %} ${created_raw} {% endcondition %}
      ;;
  }

  measure: count_a {
    type: count

    filters: {
      field: group_a
      value: "yes"
    }
  }

## filter determining time range for all "B" measures
  filter: time_b {
    type: date_time
  }

## flag for "B" measures to only include appropriate time range
  dimension: group_b {
    hidden: yes
    type: yesno
    sql: {% condition time_b %} ${created_raw} {% endcondition %}
      ;;
  }

  measure: count_b {
    type: count

    filters: {
      field: group_b
      value: "yes"
    }
  }

## filter on comparison queries to avoid querying unnecessarily large date ranges.
  dimension: is_in_time_a_or_b {
    group_label: "Time Comparison Filters"
    type: yesno
    sql: {% condition time_a %} ${created_raw} {% endcondition %}
          OR {% condition time_b %} ${created_raw} {% endcondition %}
           ;;
  }



 }
