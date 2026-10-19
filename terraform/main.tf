resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_network" "iac" {
  name = "iac-lab-network"
}

resource "docker_container" "nginx" {
  name  = "iac-nginx"
  image = docker_image.nginx.image_id

  restart = "unless-stopped"

  ports {
    internal = 80
    external = 8080
    ip       = "127.0.0.1"
  }

  networks_advanced {
    name = docker_network.iac.name
  }

  volumes {
    host_path      = abspath("${path.module}/../site")
    container_path = "/usr/share/nginx/html"
    read_only      = true
  }
}
