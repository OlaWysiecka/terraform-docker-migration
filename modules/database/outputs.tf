output "volume_id" {
  description = "PostgreSQL volume ID"
  value       = docker_volume.this.id
}

output "volume_name" {
  description = "PostgreSQL volume name"
  value       = docker_volume.this.name
}
