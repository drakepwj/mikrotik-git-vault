resource "aws_cloudwatch_metric_alarm" "monthly_cost" {
  alarm_name          = "monthly-cost-watch"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 86400
  statistic           = "Maximum"
  threshold           = 2.0
  alarm_description   = "Alert if monthly AWS spend > $2 USD"
  alarm_actions       = [aws_sns_topic.cost_alerts.arn]

  dimensions = {
    Currency = "USD"
  }
}

resource "aws_sns_topic" "cost_alerts" {
  name = "cost-alerts"
}

output "cost_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.monthly_cost.arn
}