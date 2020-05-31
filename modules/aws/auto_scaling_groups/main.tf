/*
Description: This tf Provisions Auto Scaling Group

*/

provider "aws"{
  region="${var.region}"
}


// ------------ AutoScaling Group----

resource "aws_autoscaling_group" "auto_scaling_group" {
  
  name="${var.name}"
  max_size="${var.max_size}"
  min_size="${var.min_size}"
  desired_capacity="${var.desired_capacity}"
  vpc_zone_identifier=["${var.vpc_zone_identifier}"]  // refers to VPI  ID
  health_check_type ="${var.health_check_type}"
  health_check_grace_period="${var.health_check_grace_period}"
  availability_zones= ["${var.availability_zones}"]
  protect_from_scale_in="${var.protect_from_scale_in}"
  termination_policies=["${var.termination_policies}"]

  launch_template {

        id="${var.launch_template_id}"
        version="$Latest"
  }
 
  initial_lifecycle_hook{

        name="Launch"
        default_result="CONTINUE"
        heartbeat_timeout="30"
        lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
  }
  
  initial_lifecycle_hook{

        name="Terminate"
        default_result="CONTINUE"
        heartbeat_timeout="30"
        lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"

   }


  tags = [
    {
      key                 = "Environment"
      value               = "${var.environment}"
      propagate_at_launch = true
    },
    {
    key                 = "Application"
      value               = "${var.application}"
      propagate_at_launch = true
    },

    {
    key                 = "Maintainer"
      value               = "${var.maintainer}"
      propagate_at_launch = true
    },
    {
    key                 = "Component"
      value               = "${var.component}"
      propagate_at_launch = true
    }

  ]
}

  
