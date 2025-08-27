resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.env_name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.env_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "app_db" {
  identifier        = "${var.env_name}-db"
  allocated_storage = var.allocated_storage
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = var.instance_class
  username          = var.db_username
  password          = var.db_password
  db_name           = var.db_name

  vpc_security_group_ids = [var.db_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot    = true
  multi_az               = var.multi_az
  backup_retention_period = var.backup_retention_period

  tags = {
    Name = "${var.env_name}-db"
  }
}
