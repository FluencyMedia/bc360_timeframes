view: arch_timeframes {

  derived_table: {
    datagroup_trigger: dg_bc360_campaigns

    sql:  SELECT
              ## Raw timestamp
              timestamp,
              date,
              holiday,
          FROM arch_timeframes.arch_timeframes ap;;
          partition_keys: ["date"]
          cluster_keys: ["timestamp"]
  }

  dimension: timestamp {
    type: date_time
    primary_key: yes
    sql: ${TABLE}.timestamp ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.timestamp ;;
  }

  dimension: day_of_month {
    hidden: no
    type: date_day_of_month
    sql: ${TABLE}.timestamp ;;
  }

  dimension: day_of_year {
    type: date_day_of_year
    sql: ${TABLE}.timestamp ;;
  }

  dimension: holiday {
    type: string
    sql: ${TABLE}.holiday ;;
  }

  dimension: hour_index {
    type: date_hour_of_day
    sql: ${TABLE}.timestamp ;;
  }

  dimension: month {
    type: date_month_name
    # order_by_field: "month_index"
    sql: ${TABLE}.timestamp ;;
  }

  dimension: month_index {
    type: date_month_num
    sql: ${TABLE}.timestamp ;;
  }

  dimension: month_of {
    type: date_month

    sql: ${TABLE}.timestamp ;;
  }

  dimension: month_short {
    type: string
    order_by_field: "month_index"
    sql: LEFT(${month}, 3) ;;
  }

  dimension: quarter_index {
    type: date_quarter_of_year
    sql: ${TABLE}.timestamp ;;
  }

  dimension: quarter_of {
    type: date_quarter
    sql: ${TABLE}.timestamp ;;
  }

  dimension: week_index {
    type: date_week_of_year
    hidden: no
    sql: ${TABLE}.timestamp ;;
  }

  dimension: week_of {
    type: date_week
    sql: ${TABLE}.timestamp ;;
  }

  dimension: weekday {
    type: date_day_of_week
    sql: ${TABLE}.timestamp ;;
  }

  dimension: weekday_category {
    type: string
    case: {
      when: {
        sql: ((${weekday_num} = 1) OR (${weekday_num} = 7));;
        label: "Weekend"
      }
      else: "Weekday"
    }
  }

  dimension: weekday_num {
    hidden: no
    type: date_day_of_week_index
    sql: ${TABLE}.timestamp ;;
  }

  dimension: weekday_short {
    type: string
    order_by_field: "weekday_num"
    sql: LEFT(${weekday}, 3) ;;
  }

  dimension: year {
    type: date_year
    sql: ${TABLE}.timestamp ;;
  }


}
