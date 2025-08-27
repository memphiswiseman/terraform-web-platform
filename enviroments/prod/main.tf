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

# -------------------------
# Networking Module
# -------------------------
module "networking" {
  source              = "../../modules/networking"
  env                 = terraform.workspace
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs= var.private_subnet_cidrs
  availability_zones  = ["us-east-1a", "us-east-1b"]
}

# -------------------------
# Compute Module (App + ALB)
# -------------------------
module "compute" {
  source             = "../../modules/compute"
  env                = terraform.workspace
  app_ami            = var.app_ami
  instance_type      = var.instance_type
  vpc_id             = module.networking.vpc_id
  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids
  alb_sg_id          = module.networking.public_sg_id
  app_sg_id          = module.networking.private_sg_id
}

# -------------------------
# Database Module
# -------------------------
module "database" {
  source                 = "../../modules/database"
  env_name               = terraform.workspace
  private_subnet_ids     = module.networking.private_subnet_ids
  db_sg_id               = module.networking.private_sg_id
  db_username            = var.db_username
  db_password            = var.db_password
  db_name                = var.db_name
  allocated_storage      = 20
  instance_class         = "db.t3.micro"
  multi_az               = false
  backup_retention_period= 7
}
