variable "db_common_tags" {
  type = map(string)
}

variable "db_sg_name" {
  type = string
}

variable "vpc_id" {
    type = string
}

variable "db_port" {
  type = string
 }

variable "db_subnet_one_id" {
    type = string
}

variable "db_subnet_two_id" {
    type = string
}

variable "db_name" {
  type = string
}

variable "random_password" {
  type = string
}

variable "db_subnet_group_name" {
  type = string
}

variable "subnet_group_name" {
  type = string
}