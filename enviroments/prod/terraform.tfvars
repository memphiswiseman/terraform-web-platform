aws_region = "us-east-1"
env        = "dev"

vpc_cidr             = "10.255.0.0/16"
public_subnet_cidrs  = ["10.255.1.0/24", "10.255.2.0/24"]
private_subnet_cidrs = ["10.255.3.0/24", "10.255.4.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

# Ubuntu 22.04 LTS x86_64 (example; replace with a valid/current AMI in your account/region)
app_ami       = "ami-0360c520857e3138f"
instance_type = "t3.micro"

asg_min_size          = 1
asg_max_size          = 3
asg_desired_capacity  = 2
alarm_cpu_high_threshold = 70
alarm_cpu_low_threshold  = 25

db_username = "admin"
db_password = "Pass12345word"
db_name     = "appdb"

allocated_storage       = 20
db_instance_class       = "db.t3.micro"
multi_az                = false
backup_retention_period = 7
