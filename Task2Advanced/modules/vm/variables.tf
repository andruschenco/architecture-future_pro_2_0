variable "environment" {
  description = "Environment name (dev/stage/prod)"
  type        = string

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Environment must be: dev, stage, prod"
  }
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "future-2-0"
}

variable "created_by" {
  description = "Who created resources"
  type        = string
  default     = "terraform"
}

variable "resource_count" {
  description = "Number of VMs to simulate"
  type        = number
  default     = 1

  validation {
    condition     = var.resource_count > 0 && var.resource_count <= 10
    error_message = "Resource count must be between 1 and 10"
  }
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}