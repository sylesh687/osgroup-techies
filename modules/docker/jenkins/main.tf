
// Descripton: Docker Container

provider "docker" {

}

resource "docker_image" "image" {

   name           ="${var.image_name}"
   keep_locally   = true

}

resource "docker_container" "container" {

}

