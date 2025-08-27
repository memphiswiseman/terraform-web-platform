aws_region          = "us-east-1"
env                 = "dev"

vpc_cidr            = "10.255.0.0/16"
public_subnet_cidrs = ["10.255.1.0/24", "10.255.2.0/24"]
private_subnet_cidrs= ["10.255.3.0/24", "10.255.4.0/24"]
availability_zones  = ["us-east-1a", "us-east-1b"]

app_ami       = "ami-0360c520857e3138f" # Replace with valid AMI
instance_type = "t3.micro"

db_username = "admin"
db_password = "P@ss123_"
db_name     = "appdb"

alb_sg_id = "sg-xxxxxxx"
app_sg_id = "sg-yyyyyyy"
db_sg_id  = "sg-zzzzzzz"
