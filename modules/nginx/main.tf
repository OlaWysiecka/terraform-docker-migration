terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_container" "this" {
  name  = "nginx"
  image = "nginx:alpine"

  command = ["nginx", "-g", "daemon off;"]

  network_mode = var.network_name

  ports {
    internal = 80
    external = 80
  }

  volumes {
    host_path      = var.config_path
    container_path = "/etc/nginx/nginx.conf"
    read_only      = true
  }

  lifecycle {
    ignore_changes = [
      ports,
      volumes,
      env
    ]
  }
}
