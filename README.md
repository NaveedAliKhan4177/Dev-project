AWS DevOps Modern Infrastructure (ECS Fargate + Terraform + GitHub Actions)

A fully automated, production-grade AWS infrastructure using Terraform, ECS Fargate, ALB, CloudFront, WAF, ECR, Cognito, Secrets Manager, and GitHub Actions CI/CD.

🌍 Architecture Overview
4
🔥 Features
🖥 Application Hosting

ECS Fargate serverless compute

Auto-scaling service

Secure ALB-based routing

CloudFront CDN + HTTPS

🔐 Security

AWS WAF (SQLi, XSS, Bot protection)

Cognito authentication (User Pool + App Client)

Secrets Manager for API secrets

IAM least-privilege roles

🏗 Infrastructure-as-Code

100% Terraform modules

VPC + Subnets + IGW

Security modules

ECS/ALB modules

CloudFront/WAF module

🔄 CI/CD Automation (GitHub Actions)

Docker Build

Push to AWS ECR

ECS Rolling Deployment

Zero downtime updates

🧱 Tech Stack
Layer	Service
Compute	ECS Fargate
Networking	VPC, Public + Private Subnets
Load Balancing	ALB (HTTP → Container)
CDN	CloudFront
Security	WAF, Security Groups, IAM
Identity	Cognito
Secrets	AWS Secrets Manager
CI/CD	GitHub Actions
IaC	Terraform
🔄 CI/CD Workflow Diagram
4
📦 Project Structure
aws-devops-project/
│── app/
│   ├── app.py
│   ├── Dockerfile
│   └── requirements.txt
│
│── modules/
│   ├── vpc/
│   ├── ecs_alb_secrets/
│   ├── cloudfront_waf_api/
│   ├── security_iam_ecr/
│   └── cognito/
│
│── live/
│   ├── dev/
│   └── staging/
│
└── providers.tf

🚀 Deployment Flow

Developer pushes code → GitHub Actions triggers

Docker image is built and pushed to ECR

Task Definition automatically updates

ECS deploys new version on Fargate

ALB + CloudFront route traffic

Logs stored in CloudWatch

WAF filters malicious requests

🔐 Environment Outputs

After terraform apply:

ALB URL: http://dev-alb-xxxx.ap-south-1.elb.amazonaws.com/
CloudFront URL: https://dxxxxxxx.cloudfront.net/
User Pool ID: ap-south-1_XXXX
Client ID: XXXXXXXX
ECR Repo: 475462779244.dkr.ecr.ap-south-1.amazonaws.com/dev-python-app

🧪 GitHub Actions CI/CD (deploy.yml)

Path: .github/workflows/deploy.yml

(Already added by me—scroll up if needed)

🙌 Author

Naveed Ali Khan
AWS DevOps Engineer | Terraform | CI/CD | Containers

⭐ Want to Support?

Give the repo a ⭐ on GitHub 🙂

✅ Step-3: Ab commit + push kar do
cd ~/aws-devops-project

git add README.md
git commit -m "Added professional README + Architecture diagrams"
git push origin main
