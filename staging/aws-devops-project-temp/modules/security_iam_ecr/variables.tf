variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "container_port" {
  type    = number
  default = 5000
}

variable "ecr_name" {
  type    = string
  default = "sample-python-app"
}

