variable "network_name" {
  description = "Docker network name"
  type        = string
}

variable "database_volume_name" {
  description = "PostgreSQL Docker volume name"
  type        = string
}
variable "database_name" {
  description = "PostgreSQL database name"
  type        = string
}

variable "database_user" {
  description = "PostgreSQL username"
  type        = string
}

variable "database_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
}
variable "config_path" {
  description = "Absolute path to nginx configuration"
  type        = string
}