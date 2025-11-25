#security group
resource "aws_security_group" "web_sg" {
  name   = "web-sg"
  vpc_id = aws_vpc.THIS_VPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
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
resource "aws_instance" "web-ins" {
  count = 2
  ami                    = var.my_ami
  instance_type          = var.ins_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.public[count.index].id
  key_name               = aws_key_pair.TF_key_pair.key_name

  tags = merge ( 
    var.common_tags,
    { Name = var.instance_web_name[count.index] }
   )
}
