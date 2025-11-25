#security group
resource "aws_security_group" "app_sg" {
  name   = var.app_sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = var.app_port
    to_port     = var.app_port
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

#app-key-pair
resource "aws_key_pair" "app_key_pair" {
  key_name   = "app-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKVlOOeMc+qDhYx8ZWI9/mK/B0HC0AEvMSuvXWCztRO4 root@Angrybird"
}

#Instance
resource "aws_instance" "app-ins" {
  ami                    = var.app_ami
  instance_type          = var.app_ins_type
  vpc_security_group_ids = [var.app_security_group_id]
  subnet_id              = var.private_subnet_id
  key_name               = var.app_key_pair

  tags = merge ( 
    var.app_common_tags,
    { Name = var.instance_app_name }
   )
}


