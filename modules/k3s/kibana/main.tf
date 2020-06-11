provider "kubernetes" {

}


resource "kubernetes_config_map" "config_map" {

  metadata {
    name = "${var.name}"
    
    labels {
 
      "app" = "${var.app}"
    

    }

   }

  data = {
    "filebeat.yml" = "${file("${path.module}/filebeat.yml")}"
 
  }


}
