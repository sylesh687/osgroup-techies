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
    
  //  command = " echo \"[target] \n${lxd_container.con.ip_address}\" >hosts ; ansible-playbook  -i hosts logstash.yml"
      command = "echo \"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhSbopOpKPgYK+K7PoB0kwsNzcuhDEck4Fd/WX0tPPFaOf+0QExvSWlHBRW+qf7Et2o2b+H7adWJl4E7BoOaE9kkQM7KpMn/k391tdEIPVzCX/AlDTF0+Cy3IvJzzTICE/z+uvM3afFxYrl3T5ScyztCi3fwNqxXNduOT+WcyPUDxXf6XwvlPK9D6+p1Zw6XTJiykcpwcbvw/L2AucmhoNUCKG+KC/5jXt5j2P+Hun+062z4Aqd262StfXITSdbgq0X0uj/0AaYzfD2PrilRR70S+xYvzB9k/tST1dt58TbVsMNCUjITrHg+2tMgAhLsg7xNdJeVB+Xko8z65iTzQp shaileshthakur@SuperGun\"> ~/.ssh/authorized_keys  ;echo \"[target] \n${lxd_container.con.ip_address}\" >hosts ; ansible-playbook  -i hosts logstash.yml"
 }

}


