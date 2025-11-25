variable "app_sg_name" {
  type = string
}

variable "vpc_id" {
    type = string
}

 variable "app_port" {
  type = string
 }
 
variable "app_ami" {
  type = string
  }

variable "app_ins_type" {
  type = string
}  

variable "private_subnet_id" {
    type = string
}

variable "instance_app_name" {
  type = string
}

variable "app_common_tags" {
  type = map(string)
}

variable "app_security_group_id" {
  type = string
}

variable "app_key_pair" {
  type = string
}