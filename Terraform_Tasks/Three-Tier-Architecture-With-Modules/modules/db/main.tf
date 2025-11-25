resource "aws_security_group" "db_sg" {
  name   = var.db_sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "subnet_group" {
  subnet_ids = [var.db_subnet_one_id, var.db_subnet_two_id]

  tags = merge ( 
    var.db_common_tags,
    { Name = var.db_subnet_group_name }
   )
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = var.random_password
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = var.subnet_group_name
  skip_final_snapshot  = true

  tags = var.db_common_tags
}