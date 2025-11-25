# VPC Variables --------------------------
variable "vpc_cidr" {
  type = string
}

variable "public_cidrs" {
  type = list(string)
}
variable "private_cidrs" {
  type = list(string)
}

variable "common_tags" {
  type = map(string)
}

variable "vpc_name" {
  type = string
}

variable "igw_name" {
   type = string 
}

variable "public_subnet_names" { 
  type = list(string) 
}

variable "private_subnet_names" { 
  type = list(string) 
}

variable "nat_eip_name" {
   type = string 
}

variable "nat_gateway_name" { 
  type = string 
}

variable "public_rt_name" { 
  type = string 
}

variable "private_rt_name" { 
  type = string 
}
# INS Variables --------------------------
variable "app_sg_name" {
  type = string
}
 variable "app_port" {
  type = string
 }
 
variable "my_ami" {
  type = string
  }

variable "ins_type" {
  type = string
}  

variable "instance_app_name" {
  type = string
}

variable "instance_web_name" {
  type = list(string)
}