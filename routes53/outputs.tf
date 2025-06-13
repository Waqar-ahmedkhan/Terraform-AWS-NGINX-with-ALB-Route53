output "dns_record" {
  description = "Full DNS record created"
  value       = aws_route53_record.web.name
}