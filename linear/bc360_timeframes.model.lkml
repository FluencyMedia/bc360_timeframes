connection: "bc360_main"

include: "/**/*.view.lkml"                   # include all views in this project
include: "//bc360_admin/bc360_triggers.lkml"


explore: arch_timeframes {
  group_label: "BC360 - Admin Tools"
  label: "Timeframe Architecture"
}
