#VPC---------------------------
vpc_cidr = "10.0.0.0/20"

public_cidrs = [
  "10.0.0.0/22",
  "10.0.4.0/22"
]

private_cidrs = [
  "10.0.8.0/23",
  "10.0.10.0/23",
  "10.0.12.0/24",
  "10.0.13.0/24"
]

common_tags = {
    Project = "THREE-TIER-ARCHITECTURE"
    Environment = "Prod"
    Product = "application"
}

vpc_name = "Three_Tier_VPC"

igw_name = "internet-gateway"

public_subnet_names   = [
    "web-subnet1", 
    "web-subnet2"
]

private_subnet_names  = [
    "app-subnet1", 
    "app-subnet2", 
    "db-subnet1",
    "db-subnet2"
]

nat_eip_name = "nat-eip"

nat_gateway_name = "nat-gateway"

public_rt_name = "public-route-table"

private_rt_name = "private-route-table"

#App---------------------------------------
app_sg_name = "App-security-group"

app_port = "9000"

my_ami = "ami-0ecb62995f68bb549"

ins_type = "t2.nano"

instance_app_name = "App-Server"

#WEB ---------------------------------------
my_ami = "ami-0ecb62995f68bb549"

ins_type = "t2.nano"

instance_web_name = [
    "Web-Server1",
    "Web-Server2"

]