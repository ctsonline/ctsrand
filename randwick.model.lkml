connection: "ctsdev"

# include all the views
include: "*.view"

# include all the dashboards
# include: "*.dashboard"

explore: rand_gas {
  label: "Rand Gas"
}

explore: rand_swh {
  label: "Rand SWH"
}

explore: rand_water_meters {
  label: "Rand Water Meters"
}

explore: rand_truck_wash_meters {
  label: "Rand Truck Wash Meters"
}

explore: rand_gpt {
  label: "Rand GPT Levels"
}

explore: rand_fieldmousedata {
  label: "Rand Fieldmouse data"
}

explore: rand_wastebins {
  label: "Rand Waste Bins"
}
