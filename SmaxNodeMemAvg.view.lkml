view: smaxnodememavg {
sql_table_name: opsa_default.oa_kube_kglobal;;

dimension: hostname_podname {
  description: "hostname for Node"
  type: string
  sql: ${TABLE}.kglobal_id ;;
}
dimension: node_memory {
  description: "Memory for Node"
  type: string
  sql: ${TABLE}.node_memory ;;
}
dimension: time {
  description: "Time of sample"
  type: string
  sql: ${TABLE}.timestamp_utc ;;
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

measure: average_memory {
  type: average
  sql: ${node_memory}/100 ;;
  value_format_name: percent_1

}
}
