output "alb_dns_name" {
  description = "DNS of ALB"
  value       = aws_lb.app_alb.dns_name
}

output "alb_arn" {
  description = "ALB ARN"
  value       = aws_lb.app_alb.arn
}

output "alb_target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.app_tg.arn
}

output "asg_name" {
  description = "Auto Scaling Group name"
  value       = aws_autoscaling_group.app.name
}

output "sns_topic_arn" {
  description = "SNS Topic ARN for alarms"
  value       = aws_sns_topic.alerts.arn
}
