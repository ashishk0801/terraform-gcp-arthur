variable "environment_variables" {
  description = "Environment variables for the Cloud Run service"
  type        = map(string)
  default     = {}
}

variable "min_instances" {
  description = "Minimum number of instances for the service"
  type        = number
  default     = 0
}

variable "max_instances" {
  description = "Maximum number of instances for the service"
  type        = number
  default     = 10
}

variable "cpu_limit" {
  description = "CPU limit for each container instance"
  type        = string
  default     = "1000m"
}

variable "memory_limit" {
  description = "Memory limit for each container instance"
  type        = string
  default     = "512Mi"
}

variable "allow_unauthenticated" {
  description = "Whether to allow unauthenticated access to the service"
  type        = bool
  default     = true
}
