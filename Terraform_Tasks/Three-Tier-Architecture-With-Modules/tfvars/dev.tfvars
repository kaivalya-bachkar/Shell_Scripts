mod_common_tags = {
    Project = "THREE-TIER-ARCHITECTURE"
    Environment = "dev"
    Product = "application"
}

mod_vpc_cidr = "10.0.0.0/20"

mod_public_cidrs = [
  "10.0.0.0/22",
  "10.0.4.0/22"
]

mod_private_cidrs = [
  "10.0.8.0/23",
  "10.0.10.0/23",
  "10.0.12.0/24",
  "10.0.13.0/24"
]

mod_azs = [
    "us-east-1a", 
    "us-east-1b",
    "us-east-1c",
    "us-east-1d"
]

mod_vpc_name = "Three_Tier_VPC"

mod_igw_name = "internet-gateway"

mod_public_subnet_names   = [
    "web-subnet1", 
    "web-subnet2"
]

mod_private_subnet_names  = [
    "app-subnet1", 
    "app-subnet2", 
    "db-subnet1",
    "db-subnet2"
]

mod_nat_eip_name = "nat-eip"

mod_nat_gateway_name = "nat-gateway"

mod_public_rt_name = "public-route-table"

mod_private_rt_name = "private-route-table"

#------------------------------------------------
mod_web_common_tags = {
    Project = "THREE-TIER-ARCHITECTURE"
    Environment = "dev"
    Product = "application"
}

mod_instance_count = "2"

mod_web_sg_name = "Web-security-group"

mod_web_port = "80"

mod_web_ami = "ami-0ecb62995f68bb549"

mod_web_ins_type = "t2.nano"

mod_instance_web_name = ["Web-server1", "Web-server2"]

#app---------------------------------------------
mod_app_common_tags = {
    Project = "THREE-TIER-ARCHITECTURE"
    Environment = "dev"
    Product = "application"
}

mod_app_sg_name = "App-security-group"

mod_app_port = "9000"

mod_app_ami = "ami-0ecb62995f68bb549"

mod_app_ins_type = "t2.nano"

mod_instance_app_name = "App-Server"

#db------------------------------------------------
mod_db_common_tags = {
    Project = "THREE-TIER-ARCHITECTURE"
    Environment = "dev"
    Product = "application"
}

mod_db_sg_name = "DATABASE-security-group"

mod_db_port = "3306"

mod_db_name = "mydb"

mod_db_subnet_group_name = "rds-subnet-group"