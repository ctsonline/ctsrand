view: rand_swh {
  sql_table_name: rand_swh ;;

  dimension: lat {
    label: "Latitude"
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: long {
    label: "Longitude"
    type: number
    sql: ${TABLE}.long ;;
  }

# FieldUnits.Birrarung SWH.AnalogInputs.BMarr PRIM TNK LVL.Value
# FieldUnits.Birrarung SWH.AnalogInputs.BMarr Reuse Tank EC.Value

  dimension: name {
    label: "Long Name"
    type: string
    sql: ${TABLE}.name ;;
  }


  dimension: location {
    type: string
    sql: split_part(${name}, '.', 2) ;;
  }

  dimension: data_type {
    type: string
    sql: split_part(${name}, '.', 3) ;;
  }

  dimension: description {
    type: string
    sql: split_part(${name}, '.', 4) ;;
  }

  dimension: measurement_type {
    type: string
    sql: split_part(${name}, '.', 5) ;;
  }


  dimension_group: reading {
    type: time
    timeframes: [raw, date, time, hour_of_day]
    sql: cast(TIMESTAMPTZ(${TABLE}.t1) as timestamp);;
  }

  dimension: v1 {
    label: "Value"
    type: number
    sql: ${TABLE}.v1 ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: average_value {
    type: average
    sql: ${v1} ;;
    value_format_name: decimal_2
  }

  }

