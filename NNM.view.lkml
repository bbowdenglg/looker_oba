view: nnm {
    sql_table_name: opsa_default.nnmispi_netinterface_interface  ;;

    dimension: interface_alias {
      description: "Alias"
      type: string
      sql: ${TABLE}.interface_alias ;;
    }
    dimension: utilization_in_forecast_baseline_8_week {
      description: "Util In 8 Week"
      type: string
      sql: ${TABLE}.utilization_in_forecast_baseline_8_week ;;

    }
    dimension: utilization {
      description: "Util"
      type: string
      sql: ${TABLE}.utilization ;;

    }
    dimension: utilization_in {
      description: "Util In"
      type: string
      sql: ${TABLE}.utilization_in ;;

    }
    dimension: utilization_Out {
      description: "Util Out"
      type: string
      sql: ${TABLE}.utilization_out ;;

    }
    dimension: interface_speed {
      description: "Interface Speed"
      type: string
      sql: ${TABLE}.interface_speed ;;

    }
    dimension: time {
      description: "Time of sample"
      type: string
      sql: ${TABLE}.timestamp_utc ;;

    }

    dimension: host_name {
      description: "Hostname"
      type: string
      sql: ${TABLE}.host_name ;;
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

    measure:interface_speed_avg{
      type: average
      sql_distinct_key: ${host_name} ;;
      sql: ${interface_speed} ;;
    }

    measure:utilization_in_avg{
      type: average
      sql_distinct_key: ${host_name} ;;
      sql: ${utilization_in} ;;
    }

    measure:utilization_avg{
      type: average
      sql_distinct_key: ${host_name} ;;
      sql: ${utilization} ;;
    }

  measure:util_8week_avg{
    type: average
    sql_distinct_key: ${host_name} ;;
    sql: ${utilization_in_forecast_baseline_8_week} ;;
  }

  measure:util_out_avg{
    type: average
    sql_distinct_key: ${host_name} ;;
    sql: ${utilization_Out} ;;
  }
}
