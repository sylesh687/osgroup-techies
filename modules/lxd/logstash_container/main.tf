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
    
    command = " echo \"[target] \n${lxd_container.con.ip_address}\" >hosts ; ansible-playbook  -i hosts ../playbooks/logstash.yml"
 }

}


