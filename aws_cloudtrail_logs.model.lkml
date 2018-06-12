connection: "athena"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: aws_cloudtrail_logs_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: aws_cloudtrail_logs_default_datagroup

explore: cloudtrail_logs {}

# - explore: cost_and_usage
