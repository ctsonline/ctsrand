view: rand_fieldmousedata {
     view_label: "rand fmd"
    sql_table_name: public.ctsfieldmousedata ;;

    dimension: a1 {
      group_label: "Analogs"
      type: number
      sql: ${TABLE}.a1 ;;
    }

    dimension: a2 {
      group_label: "Analogs"
      type: number
      sql: ${TABLE}.a2 ;;
    }

    dimension: a3 {
      group_label: "Analogs"
      type: number
      sql: ${TABLE}.a3 ;;
    }

    dimension: a4 {
      group_label: "Analogs"
      type: number
      sql: ${TABLE}.a4 ;;
    }



    dimension: d1 {
      group_label: "Digital"
      type: number
      sql: ${TABLE}.d1 ;;
    }

    dimension: d2 {
      group_label: "Digital"
      type: number
      sql: ${TABLE}.d2 ;;
    }

    dimension: r1 {
      group_label: "Relays"
      type: number
      sql: ${TABLE}.r1 ;;
    }

    dimension: r2 {
      group_label: "Relays"
      type: number
      sql: ${TABLE}.r2 ;;
    }

    dimension: r3 {
      group_label: "Relays"
      type: number
      sql: ${TABLE}.r3 ;;
    }

    dimension: r4 {
      group_label: "Relays"
      type: number
      sql: ${TABLE}.r4 ;;
    }

    dimension: sid {
      label: "Site ID"
      type: number
      value_format_name: id
      sql: ${TABLE}.sid;;
    }

  dimension: site_name{
    type: string
    hidden: no
    sql: REPLACE(REPLACE(REPLACE(REPLACE(${sid},'3','BBQ'),'4','Bin'),'1','GPT'),'2','Maroub WM') ;;
  }

  dimension: site_name2{
    type: string
    hidden: no
    sql: REPLACE(${sid},'4','Bin');;
  }


  dimension: cid {
    label: "Customer ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.cid ;;
  }

  dimension: client_name {
    type: string
    hidden: no
    sql: REPLACE(${cid},'21','Randwick') ;;
  }

    dimension_group: t1 {
      type: time
      timeframes: [raw, hour_of_day, day_of_week, time_of_day, date]
      sql: ${TABLE}t1 ;;
    }

    dimension_group: timestamp {
      label: "Time real"
      type: time
      convert_tz: yes
      timeframes: [raw, time, time_of_day, hour, date, week, month]
      sql: ${TABLE}.timestamp::timestamp;;
    }

    ##dimension_group: timestamp {
    ## type: time
    ##convert_tz: yes
    ##timeframes: [raw, time, time_of_day, date, hour, week, month, minute30  ]
    ##sql: convert_timezone('AEDT','AEDT', ${TABLE}.timestamp::timestamp);;
    # }


#   2017.11.14 AD at 13:31:28 AEDT

    measure: count {
      type: count
      drill_fields: []
    }


    measure: average_value_a1 {
      type: average
      sql: ${a1} ;;
    }

    measure: average_value_a2 {
      type: average
      sql: ${a2} ;;
    }

    measure: average_value_a3 {
      type: average
      sql: ${a3} ;;
    }

    measure: average_value_a4 {
      type: average
      sql: ${a4} ;;
    }

    measure: count_readings {
      type: count
      drill_fields: [average_value_a1,average_value_a2,average_value_a3,average_value_a4,]
    }
   }