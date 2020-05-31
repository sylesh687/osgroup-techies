/* 
Varibles Definitions
*/

//--------- Provider Related Variables ----

variable "region" {}


//--------- ASG Related Variables

variable "name" {}
variable "max_size" {}
variable "min_size" {}
variable "desired_capacity" {}
		
// -- Points to "vpc_zone_identifier" --> refers to the VPC ID for the Group 

variable "vpc_zone_identifier" {
  default=[""]
}

variable "protect_from_scale_in" {}
variable "termination_policies" {
  default=[""]
}
variable "launch_template_id" {}


// -------- Tag Related Variables ------

variable "application" {}
variable "environment" {}
variable "component" {}
variable "maintainer" {}



