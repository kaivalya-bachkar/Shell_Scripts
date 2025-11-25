variable "vpc_id" {
    type = string
}

variable "web_port" {
  type = string
 }

 variable "public_subnet_id" {
    type = list(string)
}

variable "web_security_group_id" {
  type = string
}

variable "web_common_tags" {
  type = map(string)
}

variable "web_ins_id" {
  type = list(string)
}

variable "load_balancer_arn" {
    type = string
}

variable "target_group_arn" {
    type = string
}
