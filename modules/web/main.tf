terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_container" "this" {
  name  = "web-app"
  image = "terraform-docker-web"

  command = ["python", "app.py"]

  network_mode = var.network_name

  ports {
    internal = 5000
    external = 5000
  }

  lifecycle {
    ignore_changes = [
      ports,
      env
    ]
  }
}
