variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "env" {
  description = "Environment name (dev/prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Public subnets (2)"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnets (2)"
  type        = list(string)
}

variable "availability_zones" {
  description = "AZs (2)"
  type        = list(string)
}

variable "app_ami" {
  description = "Ubuntu AMI for app nodes"
  type        = string
}

variable "instance_type" {
  description = "App instance type"
  type        = string
  default     = "t3.micro"
}

variable "asg_min_size" {
  type        = number
  default     = 1
}

variable "asg_max_size" {
  type        = number
  default     = 3
}

variable "asg_desired_capacity" {
  type        = number
  default     = 2
}

variable "alarm_cpu_high_threshold" {
  description = "Scale out threshold"
  type        = number
  default     = 70
}

variable "alarm_cpu_low_threshold" {
  description = "Scale in threshold"
  type        = number
  default     = 25
}

# DB
variable "db_username" { type = string }
variable "db_password" {
  type      = string
  sensitive = true
}
variable "db_name" { type = string }

variable "allocated_storage" {
  type    = number
  default = 20
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "multi_az" {
  type    = bool
  default = false
}

variable "backup_retention_period" {
  type    = number
  default = 7
}
