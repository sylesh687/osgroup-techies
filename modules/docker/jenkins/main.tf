
// Descripton: Docker Container

provider "docker" {

}

resource "docker_image" "image" {

   name           ="${var.image_name}"
   keep_locally   = true

}

resource "docker_container" "container" {

    name  = "${ var.container_name }"
    image = "${docker_image.image.latest}"
    restart = "on-failure"
    memory  = "${var.memory}"


    ports {
      internal = 8080
      external = "${var.port}"
    }


    volumes  {
       volume_name    = "JekinsImps"
       host_path       = "${var.mountpath}"
       container_path = "/var/jenkins_home"    
   }

    

}

