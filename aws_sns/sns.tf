resource "aws_sns_topic" "logwatcher_alert" {
  name = "logwatcher-alert"
}

resource "aws_sns_topic_subscription" "logwatcher_alert_subscription" {
  topic_arn = aws_sns_topic.logwatcher_alert.arn
  protocol  = "email"
  endpoint  = var.sns_email_endpoint # Email address to receive alerts
  
}