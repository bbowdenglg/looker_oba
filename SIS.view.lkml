view: sis {
  sql_table_name: opsa_default.sitescope_urlmonitor_metrics  ;;

  dimension: target_name {
    description: "Target"
    type: string
    sql: ${TABLE}.target_name ;;
  }
  dimension: monitorname {
    description: "Monitor"
    type: string
    sql: ${TABLE}.monitor_name ;;
  }
  dimension: time {
    description: "Time of sample"
    type: string
    sql: ${TABLE}.timestamp_utc ;;
  }

  dimension: roundtrip {
    description: "Round Trip"
    type: string
    sql: ${TABLE}._roundtrip_time_milliseconds_ ;;
  }

  dimension: status{
    description: "Status"
    type: string
    sql: ${TABLE}._status_ ;;
  }

    dimension_group: timestamp_utc {
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
    sql: ${TABLE}.timestamp_utc ;;
  }

  measure:roundtrip_avg{
    type: average
    sql_distinct_key: ${monitorname} ;;
    sql: ${roundtrip} ;;
  }

  #measure: average_memory {
  ##sql: ${hostname} ;;
}
