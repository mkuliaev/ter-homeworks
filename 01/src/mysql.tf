terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">=1.5.1"
}
provider "docker" {}

resource "random_password" "MYSQL_ROOT_PASSWORD" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "MYSQL_PASSWORD" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
  context = "context"
}

resource "docker_container" "mysql_container" {
  image = docker_image.mysql.image_id
  name  = "hello_world"
  env = MYSQL_ROOT_PASSWORD="${random_password.MYSQL_ROOT_PASSWORD.result}"
  env = MYSQL_DATABASE=wordpress
  env = MYSQL_USER=wordpress
  env = MYSQL_PASSWORD="${random_password.MYSQL_PASSWORD.result}"
  env = MYSQL_ROOT_HOST="%"


  ports {
    internal = 3306
    external = 127.0.0.1:3306
  }
}
