view: rand_swh {
  view_label: "rand swh"
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

# 23  FieldUnits.Truck Wash.AnalogInputs.Trade Waste Meter - Truck Wsh.Value
# 24  FieldUnits.Truck Wash.AnalogInputs.Turbidity - Truck Wash.Value
# 25  FieldUnits.Truck Wash.AnalogInputs.Wind Direction - Truck Wash.Value
# 26  FieldUnits.Truck Wash.AnalogInputs.Wind Speed - Truck Wash.Value
# 27  FieldUnits.Truck Wash.Meters.TWM001 - Toilet Water Usage - Truck Wash.Flow
# 28  FieldUnits.Truck Wash.Meters.WWM001 - Trade Waste Meter - Truck Wash.Flow


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
    timeframes: [raw, date, time, hour, hour_of_day, day_of_week, week,]
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
