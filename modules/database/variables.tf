variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for DB subnet group"
  type        = list(string)
}

variable "db_sg_id" {
  description = "DB security group ID"
  type        = string
}

variable "allocated_storage" {
  description = "DB storage (GB)"
  type        = number
  default     = 20
}

variable "db_instance_class" {
  description = "Instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "DB master username"
  type        = string
}

variable "db_password" {
  description = "DB master password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "DB name"
  type        = string
}

variable "multi_az" {
  description = "Enable Multi-AZ"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Backup retention days"
  type        = number
  default     = 7
}

variable "maintenance_window" {
  description = "Preferred maintenance window (UTC)"
  type        = string
  default     = "sun:03:00-sun:04:00"
}

variable "backup_window" {
  description = "Preferred backup window (UTC)"
  type        = string
  default     = "02:00-03:00"
}
