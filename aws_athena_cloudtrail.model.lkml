connection: "athena"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: cloudtrail_logs {
  group_label: "AWS Operations"
  label: "AWS CloudTrail Logs"
  persist_for: "24 hours"
  join: user_login_facts {
    type: left_outer
    sql_on: ${cloudtrail_logs.user_name} = ${user_login_facts.username} ;;
    relationship: many_to_one
  }
  join: user_ip_facts {
    type: left_outer
    sql_on: ${cloudtrail_logs.user_name} = ${user_ip_facts.username} ;;
    relationship: many_to_one
  }
}

explore: user_login_facts {
  group_label: "AWS Operations"
  label: "AWS User Login Facts"
  persist_for: "24 hours"
}

explore: user_ip_facts {
  group_label: "AWS Operations"
  label: "AWS User IP Facts"
  persist_for: "24 hours"
}
