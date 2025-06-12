variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs for ALB"
  type        = list(string)
}

variable "target_instances" {
  description = "List of EC2 instance IDs for target group"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for ALB"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate"
  type        = string
}