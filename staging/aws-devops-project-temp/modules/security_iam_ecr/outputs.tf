output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}

output "ecr_repo_url" {
  value = aws_ecr_repository.app.repository_url
}

output "task_execution_role_arn" {
  value = aws_iam_role.task_execution.arn
}

