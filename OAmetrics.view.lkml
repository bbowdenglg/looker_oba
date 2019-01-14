view: oametrics {

  sql_table_name: opsa_default.oa_sysperf_global  ;;

  dimension: hostname {
    description: "hostname for Node"
    type: string
    sql: ${TABLE}.host_name ;;
  }
  dimension: node_memory {
    description: "Memory"
    type: string
    sql: ${TABLE}.mem_util ;;
  }
  dimension: time {
    description: "Time of sample"
    type: string
    sql: ${TABLE}.timestamp_utc ;;
  }

  dimension: cpu {
    description: "CPU"
    type: string
    sql: ${TABLE}.cpu_util ;;
  }

  dimension: disk{
    description: "Disk"
    type: string
    sql: ${TABLE}.disk_util_peak ;;
  }

  dimension: net{
    description: "Network"
    type: string
    sql: ${TABLE}.net_packet_rate ;;
  }

  dimension: loadavg{
    description: "5 Min Load Average"
    type: string
    sql: ${TABLE}.load_avg_5m ;;
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

  #measure: average_memory {
    ##sql: ${hostname} ;;


measure: avg_load_avg {
  type: average_distinct
  sql_distinct_key: ${hostname} ;;
  sql: ${loadavg} ;;
}

  measure: mem_avg {
    type: average_distinct
    sql_distinct_key: ${hostname} ;;
    sql: ${node_memory}
    value_format_name: percent_1 ;;
  }



}
