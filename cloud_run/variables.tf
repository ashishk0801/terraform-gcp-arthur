variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "app_name" {
  type = string
}

variable "image_name" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "port" {
  type = number
}

variable "environment_variables" {
  type = map(string)
}

variable "min_instances" {
  type = number
}

variable "max_instances" {
  type = number
}

variable "cpu_limit" {
  type = string
}

variable "memory_limit" {
  type = string
}

variable "allow_unauthenticated" {
  type = bool
}
