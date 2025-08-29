terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# -----------------------------
# Networking
module "networking" {
  source               = "../../modules/networking"
  env                  = var.env
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

# -----------------------------
# Database
module "database" {
  source                  = "../../modules/database"
  env_name                = var.env
  vpc_id                  = module.networking.vpc_id
  private_subnet_ids      = module.networking.private_subnet_ids
  db_sg_id                = module.networking.db_sg_id
  allocated_storage       = var.allocated_storage
  db_instance_class       = var.db_instance_class
  db_username             = var.db_username
  db_password             = var.db_password
  db_name                 = var.db_name
  multi_az                = var.multi_az
  backup_retention_period = var.backup_retention_period
}

# -----------------------------
# Compute
module "compute" {
  source               = "../../modules/compute"
  env_name             = var.env
  app_ami              = var.app_ami
  instance_type        = var.instance_type
  vpc_id               = module.networking.vpc_id
  public_subnet_ids    = module.networking.public_subnet_ids
  private_subnet_ids   = module.networking.private_subnet_ids
  alb_sg_id            = module.networking.alb_sg_id
  app_sg_id            = module.networking.app_sg_id

  asg_min_size         = var.asg_min_size
  asg_max_size         = var.asg_max_size
  asg_desired_capacity = var.asg_desired_capacity

  alarm_cpu_high_threshold = var.alarm_cpu_high_threshold
  alarm_cpu_low_threshold  = var.alarm_cpu_low_threshold
}
