project_id = "extreme-hull-460509-u7"
region     = "us-central1"
app_name   = "flask-app"
image_name = "flask-app"
image_tag = ""

environment_variables = {
  VERSION = "1.0.0"
  ENV     = "production"
}

# Scaling configuration
min_instances = 0
max_instances = 10

# Resource limits
cpu_limit    = "1000m"
memory_limit = "512Mi"

# Security
allow_unauthenticated = true