# ======================
# BACKEND CONFIGURATION
# ======================
terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    bucket         = "my-terraform-state-waqar"
    key            = "ec2-nginx/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

# ===============
# PROVIDER CONFIG
# ===============
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# =====================
# MODULE: SECURITY GROUP
# =====================
module "security_group" {
  source = "./modules/security-group"
  name   = "web-sg-prod"
  vpc_id = var.vpc_id
}

# =====================
# MODULE: IAM ROLE
# =====================
module "iam_instance_profile" {
  source = "./modules/iam"
  name   = "ec2-nginx-role-prod"
}

# ================
# MODULE: EC2
# ================
module "ec2_web" {
  source             = "./modules/ec2-instance"
  instance_count     = var.instance_count
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  security_group_ids = [module.security_group.sg_id]
  subnet_id          = var.subnet_id
  iam_instance_profile = module.iam_instance_profile.name
  nginx_enabled      = var.nginx_enabled
  instance_names     = var.instance_names
}

# ================
# MODULE: ALB
# ================
module "alb" {
  source           = "./modules/alb"
  name             = "web-alb-prod"
  subnets          = var.public_subnets
  security_groups  = [module.security_group.sg_id]
  target_instances = module.ec2_web.instance_ids
  vpc_id           = var.vpc_id
  certificate_arn  = var.certificate_arn
}

# ======================
# MODULE: ROUTE 53
# ======================
module "route53" {
  source      = "./modules/route53"
  zone_name   = var.route53_zone_name
  record_name = var.route53_record
  alb_dns     = module.alb.dns_name
  alb_zone_id = module.alb.zone_id
}