output "alb_dns_name" {
  value = aws_lb.app_lb.dns_name
}

output "alb_arn" {
  value = aws_lb.app_lb.arn
}

output "app_instance_ids" {
  value = aws_instance.app[*].id
}

output "target_group_arn" {
  value = aws_lb_target_group.app_tg.arn
}
