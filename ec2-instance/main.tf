resource "aws_instance" "web" {
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
  iam_instance_profile   = var.iam_instance_profile

  user_data = <<-EOF
    #!/bin/bash
    exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
    yum update -y
    if ${var.nginx_enabled}; then
      amazon-linux-extras install nginx1 -y
      systemctl enable nginx
      systemctl start nginx
      echo "<h1>Welcome to $(hostname)</h1>" > /usr/share/nginx/html/index.html
    fi
  EOF

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name        = var.instance_names[count.index]
    Environment = "Production"
    Terraform   = "true"
  }

  lifecycle {
    prevent_destroy = false
  }
}