output "dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.web_alb.dns_name
}

output "zone_id" {
  description = "Zone ID of the ALB"
  value       = aws_lb.web_alb.zone_id
}