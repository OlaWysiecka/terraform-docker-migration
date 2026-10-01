terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_volume" "this" {
  name = var.volume_name
}

resource "docker_container" "this" {
  name  = "postgres"
  image = "postgres:16"

  env = [
    "POSTGRES_DB=${var.database_name}",
    "POSTGRES_USER=${var.database_user}",
    "POSTGRES_PASSWORD=${var.database_password}",
  ]

  network_mode = var.network_name

  ports {
    internal = 5432
    external = 5432
  }

    volumes {
    volume_name    = var.volume_name
    container_path = "/var/lib/postgresql/data"
  }

  lifecycle {
    ignore_changes = [
      env,
      ports,
      volumes,
    ]
  }
}
