output "container_id" {
  description = "Nginx container ID"
  value       = docker_container.this.id
}

output "container_name" {
  description = "Nginx container name"
  value       = docker_container.this.name
}
