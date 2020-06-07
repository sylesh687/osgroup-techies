/*

Descripton: This tf Creates linux container

*/

provider "lxd" {
}

resource "lxd_container" "this" {
  name      = "${var.con_name}"
  image     = "${var.img_name}"
  ephemeral = false
  config = {
    "boot.autostart" = true
    "security.nesting" = true
    "security.privileged" = true
  }
  
  limits={
    cpu="${var.cpu}"
    memory="${var.mem}"
  
  }
  profiles = ["default"]

  
 provisioner "local-exec" {
    
    command = " echo \"[target] \n${lxd_container.con.ip_address}\" >hosts ; ansible-playbook  -i hosts ../../../ansible/docker/docker.yml"
 }

}


