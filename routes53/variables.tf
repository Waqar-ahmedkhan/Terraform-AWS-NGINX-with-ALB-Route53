variable "zone_name" {
  description = "Route 53 hosted zone name"
  type        = string
}

variable "record_name" {
  description = "DNS record name"
  type        = string
}

variable "alb_dns" {
  description = "DNS name of the ALB"
  type        = string
}

variable "alb_zone_id" {
  description = "Zone ID of the ALB"
  type        = string
}