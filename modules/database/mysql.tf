# DB subnet group
resource "aws_db_subnet_group" "db" {
  name       = "${var.env_name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags       = { Name = "${var.env_name}-db-subnet-group" }
}

# Parameter group (MySQL 8.0 sample)
resource "aws_db_parameter_group" "mysql8" {
  name        = "${var.env_name}-mysql8-params"
  family      = "mysql8.0"
  description = "Parameter group for MySQL 8.0"

  # Example tuning (optional)
  parameter {
    name  = "innodb_flush_log_at_trx_commit"
    value = "1"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }
}

# RDS instance
resource "aws_db_instance" "app_db" {
  identifier                    = "${var.env_name}-db"
  allocated_storage             = var.allocated_storage
  engine                        = "mysql"
  engine_version                = "8.0"
  instance_class                = var.db_instance_class
  username                      = var.db_username
  password                      = var.db_password
  db_name                       = var.db_name

  vpc_security_group_ids        = [var.db_sg_id]
  db_subnet_group_name          = aws_db_subnet_group.db.name
  parameter_group_name          = aws_db_parameter_group.mysql8.name

  multi_az                      = var.multi_az
  publicly_accessible           = false
  skip_final_snapshot           = true
  backup_retention_period       = var.backup_retention_period
  backup_window                 = var.backup_window

  tags = { Name = "${var.env_name}-db" }
}
