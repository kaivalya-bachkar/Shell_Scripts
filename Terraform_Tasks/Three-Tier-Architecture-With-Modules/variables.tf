variable "mod_common_tags" {
  type = map(string)
}

variable "mod_vpc_cidr" {
  type = string
}

variable "mod_public_cidrs" {
  type = list(string)
}
variable "mod_private_cidrs" {
  type = list(string)
}

variable "mod_azs" {
  type = list(string)
}

variable "mod_vpc_name" {
  type = string
}

variable "mod_igw_name" {
  type = string
}

variable "mod_public_subnet_names" {
  type = list(string)
}

variable "mod_private_subnet_names" {
  type = list(string)
}

variable "mod_nat_eip_name" {
  type = string
}

variable "mod_nat_gateway_name" {
  type = string
}

variable "mod_public_rt_name" {
  type = string
}

variable "mod_private_rt_name" {
  type = string
}

#Web-------------------------------------------
variable "mod_web_common_tags" {
  type = map(string)
}

variable "mod_instance_count" {
  type = number
}
variable "mod_web_sg_name" {
  type = string
}

variable "mod_web_port" {
  type = string
}

variable "mod_web_ami" {
  type = string
}

variable "mod_web_ins_type" {
  type = string
}

variable "mod_instance_web_name" {
  type = list(string)
}


#App ------------------------------------------
variable "mod_app_common_tags" {
  type = map(string)
}

variable "mod_app_sg_name" {
  type = string
}

variable "mod_app_port" {
  type = string
}

variable "mod_app_ami" {
  type = string
}

variable "mod_app_ins_type" {
  type = string
}

variable "mod_instance_app_name" {
  type = string
}

#DB--------------------------
variable "mod_db_common_tags" {
  type = map(string)
}

variable "mod_db_sg_name" {
  type = string
}

variable "mod_db_subnet_group_name" {
  type = string
}

variable "mod_db_port" {
  type = string
}

variable "mod_db_name" {
  type = string
}



