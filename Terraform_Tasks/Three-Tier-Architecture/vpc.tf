# VPC
resource "aws_vpc" "THIS_VPC" {
  cidr_block = var.vpc_cidr

  tags = merge ( 
    var.common_tags,
    { Name = var.vpc_name }
   )
}

# internet gateway
resource "aws_internet_gateway" "THIS_IGW" {
  vpc_id = aws_vpc.THIS_VPC.id

  tags = merge(
    var.common_tags,
    { Name = var.igw_name }
  )
}

# subnets
resource "aws_subnet" "public" {
  count                   = length(var.public_cidrs)
  vpc_id                  = aws_vpc.THIS_VPC.id
  cidr_block              = var.public_cidrs[count.index]

  tags = merge(
    var.common_tags,
    {
      Name = var.public_subnet_names[count.index]
      Type = "public"
    }
  )
}

resource "aws_subnet" "private" {
  count             = length(var.private_cidrs)
  vpc_id            = aws_vpc.THIS_VPC.id
  cidr_block        = var.private_cidrs[count.index]
  
  tags = merge(
    var.common_tags,
    {
      Name = var.private_subnet_names[count.index]
      Type = "private"
    }
  )
}

# elastic-ip for natgateway
resource "aws_eip" "THIS_EIP_NAT" {
  domain   = "vpc"

  tags = merge(
    var.common_tags,
    { Name = var.nat_eip_name }
  )
}

# natgateway
resource "aws_nat_gateway" "THIS_NAT" {
  allocation_id = aws_eip.THIS_EIP_NAT.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    var.common_tags,
    { Name = var.nat_gateway_name }
  )

   depends_on = [aws_internet_gateway.THIS_IGW]
}

# Route_tables
resource "aws_route_table" "PUBLIC_RT" {
  vpc_id = aws_vpc.THIS_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.THIS_IGW.id
  }

  tags = merge(
    var.common_tags,
    { Name = var.public_rt_name }
  )
}

resource "aws_route_table" "PRIVATE_RT" {
  vpc_id = aws_vpc.THIS_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.THIS_NAT.id
  }

  tags = merge(
    var.common_tags,
    { Name = var.private_rt_name }
  )
}

# Route_Table_Association
resource "aws_route_table_association" "public_association" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.PUBLIC_RT.id
}

resource "aws_route_table_association" "private_association" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.PRIVATE_RT.id
}