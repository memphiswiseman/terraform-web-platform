variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "app_ami" {
  description = "Ubuntu AMI ID for app nodes"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for ALB"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for ASG"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "ALB Security Group ID"
  type        = string
}

variable "app_sg_id" {
  description = "App Security Group ID"
  type        = string
}

variable "asg_min_size" {
  description = "Min ASG size"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Max ASG size"
  type        = number
  default     = 3
}

variable "asg_desired_capacity" {
  description = "Desired ASG size"
  type        = number
  default     = 1
}

variable "alarm_cpu_high_threshold" {
  description = "Scale-out CPU % threshold"
  type        = number
  default     = 70
}

variable "alarm_cpu_low_threshold" {
  description = "Scale-in CPU % threshold"
  type        = number
  default     = 25
}
