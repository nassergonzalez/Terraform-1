terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  count = 2
  image = docker_image.nginx.latest
  name  = format("%s_%s",var.container_name,count.index+1)
  ports {
    internal = 80
  }
}

variable "container_name" {
  type = string
  default = "test"
}
