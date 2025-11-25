variable "web_sg_name" {
  type = string
}

variable "vpc_id" {
    type = string
}

 variable "web_port" {
  type = string
 }
 
variable "web_ami" {
  type = string
  }

variable "web_ins_type" {
  type = string
}  

variable "public_subnet_id" {
    type = list(string)
}

variable "instance_web_name" {
  type = list(string)
}

variable "web_common_tags" {
  type = map(string)
}

variable "web_security_group_id" {
  type = string
}

variable "web_key_pair" {
  type = string
}

variable "instance_count" {
  type = number
}