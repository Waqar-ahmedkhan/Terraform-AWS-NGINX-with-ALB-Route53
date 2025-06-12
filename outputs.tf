output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.dns_name
}

output "instance_public_ips" {
  description = "Public IPs of EC2 instances"
  value       = module.ec2_web.public_ips
}

output "instance_private_ips" {
  description = "Private IPs of EC2 instances"
  value       = module.ec2_web.private_ips
}

output "security_group_id" {
  description = "Security Group ID for web servers"
  value       = module.security_group.sg_id
}

output "nginx_status" {
  description = "NGINX installation status"
  value       = var.nginx_enabled ? "NGINX installed on instances" : "NGINX not installed"
}