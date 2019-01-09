view: pscupodmb {
 sql_table_name: opsa_default.oa_kube_kglobal;;

  dimension: sourcename {
    description: "Source"
    type: string
    sql: ${TABLE}.sourceid ;;
  }
  dimension: podname {
    description: "Pod Name"
    type: string
    sql: ${TABLE}.kglobal_id ;;
  }
  dimension: node_memory {
    description: "Pod MB"
    type: string
    sql: ${TABLE}.pod_memory ;;
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
    sql: ${node_memory};;


  }
}
