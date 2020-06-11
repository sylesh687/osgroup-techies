provider "kubernetes" {

}


resource "kubernetes_service" "service" {

  metadata {

    name = "${var.name}"

  }

  spec {
    
   selector={
     app = "${var.name}"
   }

  port {
      port        = 8080
      target_port = 5601
    }

  
  type = "NodePort"
  }

}


resource "kubernetes_config_map" "config_map" {

  metadata {
    name = "${var.name}"
    
    labels = {
 
      app = "${var.name}"
    

    }

   }

  data = {
    "filebeat.yml" = "${file("${path.module}/filebeat.yml")}"
 
  }


}
