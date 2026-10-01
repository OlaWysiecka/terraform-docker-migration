output "container_id" {
  description = "Web application container ID"
  value       = docker_container.this.id
}

output "container_name" {
  description = "Web application container name"
  value       = docker_container.this.name
}
