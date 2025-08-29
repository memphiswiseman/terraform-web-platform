variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs (2)"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs (2)"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones (2)"
  type        = list(string)
}
