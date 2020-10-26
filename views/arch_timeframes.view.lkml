view: arch_timeframes {
  label: "4. Timeframes - BASE"

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
    hidden: yes
    sql: ${TABLE}.timestamp ;;
  }

  dimension: date {
    label: "  Date"
    type: date
    sql: ${TABLE}.timestamp ;;
  }

  dimension: day_of_month {
    label: "Day of Month"
    group_label: "Monthly"
    hidden: no
    type: date_day_of_month
    sql: ${TABLE}.timestamp ;;
  }

  dimension: day_of_year {
    label: "Day of Year"
    group_label: "Yearly"
    type: date_day_of_year
    sql: ${TABLE}.timestamp ;;
  }

  dimension: holiday {
    label: "Holiday"
    group_label: "Daily"
    type: string
    sql: ${TABLE}.holiday ;;
  }

  dimension: hour_index {
    label: "Hour of Day"
    group_label: "Daily"
    type: date_hour_of_day
    sql: ${TABLE}.timestamp ;;
  }

  dimension: month_name {
    group_label: "Monthly"
    label: "Month Label"
    description: "Name of month (no year)"
    type: date_month_name
    # order_by_field: "month_index"
    sql: ${TABLE}.timestamp ;;
  }

  dimension: month_index {
    group_label: "Monthly"

    type: date_month_num
    sql: ${TABLE}.timestamp ;;
  }

  dimension: month {
    label: "  Month"
    # group_label: "Monthly"
    type: date_month

    sql: ${TABLE}.timestamp ;;
  }

  dimension: month_short {
    label: "MMM"
    group_label: "Monthly"
    type: string
    order_by_field: "month_index"
    sql: LEFT(${month}, 3) ;;
  }

  dimension: quarter_index {
    label: "Quarter Label"
    group_label: "Quarterly"
    type: date_quarter_of_year
    sql: ${TABLE}.timestamp ;;
  }

  dimension: quarter_of {
    label: "  Quarter"
    type: date_quarter
    sql: ${TABLE}.timestamp ;;
  }

  dimension: week_index {
    group_label: "Weekly"
    type: date_week_of_year
    hidden: no
    sql: ${TABLE}.timestamp ;;
  }

  dimension: week_of {
    group_label: "Weekly"
    type: date_week
    sql: ${TABLE}.timestamp ;;
  }

  dimension: weekday {
    label: "Weekday"
    group_label: "Weekly"
    type: date_day_of_week
    sql: ${TABLE}.timestamp ;;
  }

  dimension: weekday_category {
    label: "Weekday Category"
    group_label: "Weekly"
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
    group_label: "Weekly"
    hidden: no
    type: date_day_of_week_index
    sql: ${TABLE}.timestamp ;;
  }

  dimension: weekday_short {
    group_label: "Weekly"
    type: string
    order_by_field: "weekday_num"
    sql: LEFT(${weekday}, 3) ;;
  }

  dimension: year {
    label: "  Year"
    # group_label: "Yearly"
    type: date_year
    sql: ${TABLE}.timestamp ;;
  }


}
