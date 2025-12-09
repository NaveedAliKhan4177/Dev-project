#
# LIVE ENVIRONMENT (DEV)
#

###############################
# VPC MODULE
###############################

module "vpc" {
  source     = "../../modules/vpc"
  name       = "dev"
  aws_region = var.aws_region

  vpc_cidr = "10.0.0.0/16"

  public_subnets = {
    a = "10.0.1.0/24"
    b = "10.0.2.0/24"
  }

  private_subnets = {
    a = "10.0.11.0/24"
    b = "10.0.12.0/24"
  }
}

###############################
# SECURITY + IAM + ECR
###############################

module "security" {
  source       = "../../modules/security_iam_ecr"
  name         = "dev"
  vpc_id       = module.vpc.vpc_id
  container_port = 5000
  ecr_name     = "dev-python-app"
}

###############################
# CLOUDWATCH LOG GROUP
###############################

module "cloudwatch" {
  source            = "../../modules/cloudwatch"
  log_group_name    = "/aws/ecs/dev-python-app"
  retention_in_days = 14
}

###############################
# ECS + ALB + SECRETS
###############################

module "ecs" {
  source = "../../modules/ecs_alb_secrets"

  name                 = "dev"
  vpc_id               = module.vpc.vpc_id
  public_subnet_ids    = module.vpc.public_subnet_ids
  private_subnet_ids   = module.vpc.private_subnet_ids

  alb_sg_id            = module.security.alb_sg_id
  ecs_sg_id            = module.security.ecs_sg_id

  task_execution_role_arn = module.security.task_execution_role_arn

  container_image = var.container_image
  container_port  = 5000

  task_cpu    = 256
  task_memory = 512

  desired_count = 1

  app_secret_value = "myapp-secret"
  log_group        = "/aws/ecs/dev-python-app"

  aws_region  = var.aws_region
  environment = "dev"
}

###############################
# CLOUDFront + WAF
###############################

module "cloudfront" {
  source = "../../modules/cloudfront_waf_api"

  name               = "dev"
  origin_domain_name = module.ecs.alb_dns_name
}

###############################
# COGNITO
###############################

module "cognito" {
  source = "../../modules/cognito"
  name   = "dev"
}

###############################
# OUTPUTS
###############################

output "alb_dns" {
  value = module.ecs.alb_dns_name
}

output "cloudfront_url" {
  value = module.cloudfront.cloudfront_domain
}

output "ecr_repo" {
  value = module.security.ecr_repo_url
}

output "user_pool_id" {
  value = module.cognito.user_pool_id
}

output "client_id" {
  value = module.cognito.client_id
}

