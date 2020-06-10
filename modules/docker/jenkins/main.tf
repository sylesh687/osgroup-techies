/*

Descripton: Docker Container

*/

provider "docker" {

}


resource "docker_image" "image" {

   name           ="${var.image_name}"
   keep_locally   = true

}

resource "docker_container" "container" {

  image  = "${docker_image.image.latest}"
  name   = "${var.container_name"
  restart = "on-failure"
  memory  = "${var.memory}"


  volumes {

      host_path        = "${var.mountpath}"
      container_path   = /var/jenkins_home
      
  
  }

  ports {
    internal = 8080
    external = "${var.port}"
  }


}

