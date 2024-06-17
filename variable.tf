# variables.tf

variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
}

variable "region" {
  description = "The region to deploy resources in."
  type        = string
}

# variable "credentials_file_path" {
#   description = "Path to the GCP credentials file."
#   type        = string
# }

variable "redis_instance_name" {
  description = "The name of the Redis instance."
  type        = string
}

variable "memory_size_gb" {
  description = "The size of memory in GB for the Redis instance."
  type        = number
}

variable "redis_tier" {
  description = "The service tier of the Redis instance."
  type        = string
  }

variable "location_id" {
  description = "The location ID for the Redis instance (e.g., 'us-central1-a')."
  type        = string
}

variable "redis_version" {
  description = "The version of Redis software."
  type        = string
  
}

variable "display_name" {
  description = "A display name for the Redis instance."
  type        = string
}
