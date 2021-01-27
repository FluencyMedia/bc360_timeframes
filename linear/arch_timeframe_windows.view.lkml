view: arch_timeframe_windows {
  label: "4. Timeframes - BASE"

  derived_table: {
    datagroup_trigger: dg_bc360_campaigns

    sql:  SELECT
              ROW_NUMBER() OVER () row_id,
              client_id,
              timeframe,
              timestamp,
              MIN(timestamp) OVER (PARTITION BY timeframe) timeframe_start,
              MAX(timestamp) OVER (PARTITION BY timeframe) timeframe_end,
          FROM bc360-main.arch_timeframes.arch_timeframe_windows;;
  }

  dimension: row_id {
    label: "Row ID [Windows]"
    hidden: yes
    primary_key: yes

    sql: ${TABLE}.row_id ;;
  }

  dimension: client_id {
    label: "Client ID [Windows]"
    hidden: yes

    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: timeframe {
    label: "Window"
    hidden: no

    type: string
    order_by_field: timeframe_start
    sql: ${TABLE}.timeframe ;;
  }

  dimension: timestamp {
    label: "Timestamp [Windows]"
    hidden: yes

    type: date_time

    sql: ${TABLE}.timestamp ;;
  }

  dimension: timeframe_start {
    label: "Window Start"
    hidden: yes

    type: date_time
    sql: ${TABLE}.timeframe_start ;;
  }

}
