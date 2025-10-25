terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}


resource "docker_image" "springapp" {
  name         = "subasangeeth/springapp:latest"
  keep_locally = true
}

resource "docker_container" "springapp_container" {
  name  = "spring-app"
  image = docker_image.springapp.image_id
  ports {
    internal = 8090
    external = 8090
  }
}
