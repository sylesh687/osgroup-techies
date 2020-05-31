/*
 
 Description: This tf is for Provisioning Launch Templates
 
 Pre: One has to have Image Already Created

*/

provider "aws"{
  region="${var.region}"
}


// ------------ Launch Template -------

resource "aws_launch_template" "launch_template" {
  name="${var.name}"
  description="${var.description}"
  image_id="${var.image_id}"
  instance_type="${var.instance_type}"
  key_name="${var.key_name}"
  disable_api_termination="${var.disable_api_termination}"
  user_data="${var.user_data}"
  iam_instance_profile {
        name="${var.iam_instance_profile}"
  }
  
  tags={
     Environment="${var.environment}"
     Application="${var.application}"
     Component="${var.component}"
     Maintainer="${var.maintainer}"
  }
  
  lifecycle {
    create_before_destroy = true
  }
}


