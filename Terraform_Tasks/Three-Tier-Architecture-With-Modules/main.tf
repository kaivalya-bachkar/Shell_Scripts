module "THIS_VPC" {
  source               = "./modules/vpc"
  common_tags          = var.mod_common_tags
  vpc_cidr             = var.mod_vpc_cidr
  public_cidrs         = var.mod_public_cidrs
  private_cidrs        = var.mod_private_cidrs
  azs = var.mod_azs
  vpc_name             = var.mod_vpc_name
  igw_name             = var.mod_igw_name
  public_subnet_names  = var.mod_public_subnet_names
  private_subnet_names = var.mod_private_subnet_names
  nat_eip_name         = var.mod_nat_eip_name
  nat_gateway_name     = var.mod_nat_gateway_name
  public_rt_name       = var.mod_public_rt_name
  private_rt_name      = var.mod_private_rt_name
}

module "WEB_INSTANCE" {
  source                = "./modules/web"
  instance_count        = var.mod_instance_count
  web_common_tags       = var.mod_web_common_tags
  web_sg_name           = var.mod_web_sg_name
  vpc_id                = module.THIS_VPC.vpc_id
  public_subnet_id      = module.THIS_VPC.public_subnet_id
  web_port              = var.mod_web_port
  web_ami               = var.mod_web_ami
  web_ins_type          = var.mod_web_ins_type
  web_security_group_id = module.WEB_INSTANCE.web_security_group_id
  instance_web_name     = var.mod_instance_web_name
  web_key_pair          = module.WEB_INSTANCE.web_key_pair
}

module "APP_INSTANCE" {
  source                = "./modules/app"
  app_common_tags       = var.mod_app_common_tags
  app_sg_name           = var.mod_app_sg_name
  vpc_id                = module.THIS_VPC.vpc_id
  private_subnet_id     = module.THIS_VPC.private_subnet_id
  app_port              = var.mod_app_port
  app_ami               = var.mod_app_ami
  app_ins_type          = var.mod_app_ins_type
  app_security_group_id = module.APP_INSTANCE.app_security_group_id
  instance_app_name     = var.mod_instance_app_name
  app_key_pair          = module.APP_INSTANCE.app_key_pair
}

module "DB_INSTANCE" {
  source               = "./modules/db"
  db_common_tags       = var.mod_db_common_tags
  db_name              = var.mod_db_name
  db_sg_name           = var.mod_db_sg_name
  vpc_id               = module.THIS_VPC.vpc_id
  db_port              = var.mod_db_port
  db_subnet_one_id     = module.THIS_VPC.db_subnet_one_id
  db_subnet_two_id     = module.THIS_VPC.db_subnet_two_id
  subnet_group_name    = module.DB_INSTANCE.db_subnet_group
  random_password      = module.DB_INSTANCE.random_password
  db_subnet_group_name = var.mod_db_subnet_group_name

}

module "ALB" {
  source                = "./modules/alb"
  web_common_tags       = var.mod_web_common_tags
  vpc_id                = module.THIS_VPC.vpc_id
  web_port              = var.mod_web_port
  public_subnet_id      = module.THIS_VPC.public_subnet_id
  web_security_group_id = module.WEB_INSTANCE.web_security_group_id
  load_balancer_arn     = module.ALB.load_balancer_arn
  target_group_arn      = module.ALB.target_group_arn
  web_ins_id            = module.WEB_INSTANCE.web-ins-id
}