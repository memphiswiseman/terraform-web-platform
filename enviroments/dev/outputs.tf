output "alb_dns_name" {
  value = module.compute.alb_dns_name
}

output "db_endpoint" {
  value = module.database.db_endpoint
}

output "vpc_id" {
  value = module.networking.vpc_id
}
