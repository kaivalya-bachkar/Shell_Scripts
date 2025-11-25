#security group
resource "aws_security_group" "web_sg" {
  name   = var.web_sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = var.web_port
    to_port     = var.web_port
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

#Web
resource "aws_key_pair" "web_key_pair" {
  key_name   = "web-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKVlOOeMc+qDhYx8ZWI9/mK/B0HC0AEvMSuvXWCztRO4 root@Angrybird"
}

#Instance
resource "aws_instance" "web-ins" {
  count         = var.instance_count
  ami                    = var.web_ami
  instance_type          = var.web_ins_type
  vpc_security_group_ids = [var.web_security_group_id]
  subnet_id              = var.public_subnet_id[count.index]
  key_name               = var.web_key_pair

  tags = merge ( 
    var.web_common_tags,
    { Name = var.instance_web_name[count.index] }
   )
}