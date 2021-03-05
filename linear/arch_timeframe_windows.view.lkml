view: arch_timeframe_windows {
  label: "4. Timeframes"

  derived_table: {
    datagroup_trigger: dg_bc360_campaigns

    sql:  SELECT
              ROW_NUMBER() OVER () row_id,
              client_id,
              topic,
              phase,
              status,
              timestamp,
              MIN(timestamp) OVER (PARTITION BY topic) topic_start,
              MAX(timestamp) OVER (PARTITION BY topic) topic_end,
              MIN(timestamp) OVER (PARTITION BY topic, phase) phase_start,
              MAX(timestamp) OVER (PARTITION BY topic, phase) phase_end,
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

  dimension: topic {
    label: "Topic"
    hidden: no

    type: string
    order_by_field: topic_start
    sql: ${TABLE}.topic ;;
  }

  dimension: topic_start {
    label: "Topic Start"
    hidden: no

    type: date_time
    sql: ${TABLE}.topic_start ;;
  }

  dimension: topic_end {
    label: "Topic End"
    hidden: no

    type: date_time
    sql: ${TABLE}.topic_end ;;
  }

  dimension: phase {
    label: "Phase"
    hidden: no

    type: string
    order_by_field: phase_start
    sql: ${TABLE}.phase ;;
  }

  dimension: phase_start {
    label: "Phase Start"
    hidden: no

    type: date_time
    sql: ${TABLE}.phase_start ;;
  }

  dimension: phase_end {
    label: "Phase End"
    hidden: no

    type: date_time
    sql: ${TABLE}.phase_end ;;
  }

  dimension: timestamp {
    label: "Timestamp [Windows]"
    hidden: yes

    type: date_time

    sql: ${TABLE}.timestamp ;;
  }

}
