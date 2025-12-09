AWS DevOps Project — ECS Fargate | CloudFront | ALB | Cognito | API Gateway | ECR | WAF | Secrets Manager | Terraform IaC
Author: Naveed Ali Khan
Environment: Dev + Staging
Tech Stack: Terraform, AWS ECS Fargate, CloudFront, WAF, Cognito, API Gateway, ECR, Secrets Manager, VPC, ALB
📌 Project Overview

This project provisions a fully-automated, production-grade AWS infrastructure using Terraform following DevOps best practices.

It includes:

Custom VPC (public + private subnets)

ECS Fargate cluster running Python API container

ALB (Application Load Balancer)

CloudFront CDN + WAF

API Gateway (REST)

Cognito Authentication + SSO

ECR for Docker Images

Secrets Manager for credentials

CloudWatch logging

Environment-based infra (dev & staging)

GitHub-ready folder structure

📌 Folder Structure
Dev-project/
 ├── app/
 │    ├── app.py
 │    ├── Dockerfile
 │    └── requirements.txt
 │
 ├── modules/
 │    ├── vpc/
 │    ├── ecs_alb_secrets/
 │    ├── cloudfront_waf_api/
 │    ├── cognito/
 │    ├── security_iam_ecr/
 │    └── cloudwatch/
 │
 ├── live/
 │    ├── dev/
 │    │    ├── main.tf
 │    │    ├── variables.tf
 │    │    └── terraform.tfvars
 │    │
 │    └── staging/
 │         ├── main.tf
 │         ├── variables.tf
 │         └── terraform.tfvars
 │
 └── providers.tf

🏗 Project Architecture (High Level)

(I'll generate a diagram image for you if you want — just say “make diagram”)

Flow:

User → CloudFront → WAF → ALB → ECS Fargate → App Container → Secrets Manager → CloudWatch Logs

⚙️ Terraform Deployment Commands
Initialize
terraform init

Validate
terraform validate

Plan changes
terraform plan

Deploy
terraform apply -auto-approve

🐳 Build & Push Docker Image to ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin <ECR_URL>

docker build -t dev-python-app .
docker tag dev-python-app:latest <ECR_URL>:latest

docker push <ECR_URL>:latest

🚀 How to Deploy New Version (CI/CD Ready)
aws ecs update-service \
 --cluster dev-cluster \
 --service dev-service \
 --force-new-deployment

🔒 Security Built-In

IAM role for ECS Tasks

Least privilege execution

Secrets Manager for API secrets

CloudFront with WAF (DDoS + OWASP)

🌍 Environment URLs
Environment	URL
ALB (dev)	http://dev-alb-xxxx.elb.amazonaws.com/
CloudFront (dev)	https://xxxxx.cloudfront.net/
ALB (staging)	to be created
CloudFront (staging)	to be created
