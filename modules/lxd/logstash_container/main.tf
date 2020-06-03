/*

Descripton: This tf Creates linux container

*/

provider "lxd" {
}

resource "lxd_container" "con" {
  name      = "${var.con_name}"
  image     = "${var.img_name}"
  ephemeral = false
  config = {
    "boot.autostart" = true
  }
  
  limits={
    cpu="${var.cpu}"
    memory="${var.mem}"
  
  }
  profiles = ["default"]

  
 provisioner "local-exec" {
    command = "ansible-playbook -i ${lxd_container.con.ip_address} logstash.yml"
 }

}


