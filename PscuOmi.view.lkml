view: pscuomi {
  sql_table_name: opsa_default.opsa_collection_message;;

  dimension: sourcename {
    description: "Source"
    type: string
    sql: ${TABLE}.log_technology ;;
  }
  dimension: hostname {
    description: "Host Name"
    type: string
    sql: ${TABLE}.hostname ;;
  }
  dimension: severity {
    description: "Severity"
    type: string
    sql: ${TABLE}.device_severity ;;
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

  dimension: message {
    description: "Message"
    type: string
    sql: ${TABLE}.message ;;
  }

  measure: severitycount{
    type: count
    drill_fields: [severity]
    }

  measure: severitysum{
    type: sum
    sql: ${TABLE}.severity ;;
    drill_fields: [severitycount]
  }
}
