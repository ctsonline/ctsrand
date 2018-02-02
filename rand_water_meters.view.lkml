view: rand_water_meters {
   sql_table_name: public.rand_water_meters ;;

  dimension: Value{
    label: "Meter Values"
    type: number
    sql: ${TABLE}.v1 ;;
  }
  dimension_group: reading {
    type: time
    timeframes: [raw, date, time, hour, hour_of_day, day_of_week, week,]
    sql: cast(TIMESTAMPTZ(${TABLE}.t1) as timestamp);;
  }

  dimension: name {
    label: "Long Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: area {
    type: string
    sql: split_part(${name}, '.', 2) ;;
  }

  dimension: device {
    type: string
    sql: split_part(${name}, '.', 3) ;;
  }

  dimension:  application {
    type: string
    sql: split_part(${name}, '.', 5) ;;
  }

  dimension:  location {
    label: "Meter Location"
    type: string
    sql: split_part(${name}, '.',4 ) ;;
  }

  dimension:  MWM_decon {
    type: string
    sql: split_part(${name}, '.',4 ) ;;
  }

  dimension: MWM{
    type: string
    sql: split_part(${MWM_decon}, ' ',1) ;;
  }



### FieldUnits.Albert St 1.Meters.ALBE FM.Accumulator
### FieldUnits.Albert St 1.Meters.ALBE FM.Flow
### FieldUnits.Alex Pump.Meters.MWM BTHS DRV ALEX PMP.Flow

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.long ;;
  }


  dimension: time {
    label: "time"
    type: string
    sql: ${TABLE}.t1 ;;
  }

  dimension: t1 {
    label: "Date and Time"
    type: string
    sql: cast(TIMESTAMPTZ(${TABLE}.t1) as timestamp) ;;
  }

  dimension: v1 {
    hidden: yes
    type: number
    sql: ${TABLE}.v1 ;;
  }

  # dimension: dim.val {
  #   type: number
  #   sql: ${TABLE}.v1 ;;
  # }

  measure: accumulated_Value {
    type: average
    sql: ${v1}  ;;
    value_format: "0.000"
  }

  measure: min_value{
    type: min
    sql: ${v1} ;;
    value_format: "0.000"
  }

  measure: max_value{
    type: max
    sql: ${v1} ;;
    value_format: "0.000"
  }

}