variable "name" { type = string }
variable "vpc_id" { type = string }

variable "public_subnet_ids" { type = list(string) }
variable "private_subnet_ids" { type = list(string) }

variable "alb_sg_id" { type = string }
variable "ecs_sg_id" { type = string }

variable "task_execution_role_arn" { type = string }

variable "container_image" { type = string }
variable "container_port" { type = number }

variable "task_cpu" { type = number }
variable "task_memory" { type = number }

variable "desired_count" { type = number }

variable "app_secret_value" { type = string }

variable "log_group" { type = string }
variable "aws_region" { type = string }
variable "environment" { type = string }

