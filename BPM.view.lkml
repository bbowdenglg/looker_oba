view: bpm {
    sql_table_name: opsa_default.bpm_application_performance  ;;

    dimension: transaction_name {
      description: "Transaction"
      type: string
      sql: ${TABLE}.transaction ;;
    }
    dimension: application_name {
      description: "Application"
      type: string
      sql: ${TABLE}.application ;;

    }
    dimension: transaction_response_time_name {
      description: "Response Time"
      type: string
      sql: ${TABLE}.transaction_response_time ;;

    }
    dimension: transaction_backend_time_name {
      description: "Backend Time"
      type: string
      sql: ${TABLE}.transaction_backend_time ;;

    }
    dimension: transaction_client_time_name {
      description: "Client Time"
      type: string
      sql: ${TABLE}.transaction_client_time ;;

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
      sql_distinct_key: ${transaction_name} ;;
      sql: ${transaction_response_time_name} ;;
    }

    measure:backend_avg{
      type: average
      sql_distinct_key: ${transaction_name} ;;
      sql: ${transaction_backend_time_name} ;;
    }

    measure:client_time_avg{
      type: average
      sql_distinct_key: ${transaction_name} ;;
      sql: ${transaction_client_time_name} ;;
  }


    #measure: average_memory {
    ##sql: ${hostname} ;;
  }
