#security group
resource "aws_security_group" "app_sg" {
  name   = var.app_sg_name
  vpc_id = aws_vpc.THIS_VPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
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

#Instance
resource "aws_instance" "app-ins" {
  ami                    = var.my_ami
  instance_type          = var.ins_type
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  subnet_id              = aws_subnet.private[0].id
  key_name               = aws_key_pair.TF_key_pair.key_name

  tags = merge ( 
    var.common_tags,
    { Name = var.instance_app_name }
   )
}


