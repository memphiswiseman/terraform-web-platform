# EC2 Instances
resource "aws_instance" "app" {
  count         = 2
  ami           = var.app_ami
  instance_type = var.instance_type
  subnet_id     = element(var.private_subnet_ids, count.index)
  vpc_security_group_ids = [var.app_sg_id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable nginx1
              sudo yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Hello from ${var.env} App Server $(hostname)</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "${var.env}-app-${count.index + 1}"
  }
}

# Register instances in Target Group
resource "aws_lb_target_group_attachment" "app_attach" {
  count            = length(aws_instance.app[*].id)
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = aws_instance.app[count.index].id
  port             = 80
}
