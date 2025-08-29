output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.networking.private_subnet_ids
}

output "alb_dns_name" {
  value = module.compute.alb_dns_name
}

output "alb_arn" {
  value = module.compute.alb_arn
}

output "asg_name" {
  value = module.compute.asg_name
}

output "sns_topic_arn" {
  value = module.compute.sns_topic_arn
}

output "db_endpoint" {
  value = module.database.db_endpoint
}
