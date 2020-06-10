/*

Descripton: This Module Get Us Nginx Up And Running on Docker

*/

provider "docker" {
}

// Nginx Image 

resource "docker_image" "image" {

   name           ="${var.image_name}"
   keep_locally   = true

}


// Nginx Container 
resource "docker_container" "container" {


  name    = "${var.container_name}"
  image   = "${docker_image.image.latest}"
  restart = "on-failure"


  ports {
    internal = 80
    external = 9999
  }

//  volumes {
//    host_path = ""
//    container_path = ""
//    read_only = true
//
//    host_path = ""
//    container_path = ""
//    read_only = true
//  }
//
}


