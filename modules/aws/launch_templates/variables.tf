/*

Variable Definitions 

*/

//--------- Provider Related Variables ----

variable "region" {}

// ----------------- Launch Template Vars ---
variable "name" {}
variable "description" {}
variable "image_id" {}
variable "instance_type"{}
variable "key_name" {}
variable "vpc_security_group_ids"{
  default=[""]
}
variable "disable_api_termination"{
   default=false
}
variable "user_data" {}
variable "iam_instance_profile" {}


// ---------- ----- Tag Variables --------



variable "application" {}
variable "environment" {}
variable "component" {}
variable "maintainer" {}



