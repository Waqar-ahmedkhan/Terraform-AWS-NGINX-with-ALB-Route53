variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "default"
}

variable "vpc_id" {
  description = "VPC ID for resources"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instances"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2, update as needed
}

variable "key_name" {
  description = "SSH key pair name for EC2 access"
  type        = string
}

variable "nginx_enabled" {
  description = "Enable NGINX installation"
  type        = bool
  default     = true
}

variable "instance_names" {
  description = "Names for EC2 instances"
  type        = list(string)
  default     = ["web-1", "web-2"]
}

variable "route53_zone_name" {
  description = "Route 53 hosted zone name (e.g., example.com)"
  type        = string
}

variable "route53_record" {
  description = "DNS record name (e.g., www)"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate for ALB"
  type        = string
}