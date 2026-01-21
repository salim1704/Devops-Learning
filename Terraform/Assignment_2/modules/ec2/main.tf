resource "aws_instance" "this" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data     = var.user_data
  tags = {
    Name = "wordpress_EC2_Instance"
  }

}

data "aws_vpc" "selected" {
  default = true

}

resource "aws_security_group" "ec2_sg" {
    name        = "ec2_sg"  
    description = "Security group for EC2 instance"
    vpc_id = data.aws_vpc.selected.id

ingress {
   description = "Allow HTTP"
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
}

ingress {
  description = "Allow HTTPS"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
    }
    
egress {
  description = "Allow all outbound traffic"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
    }

tags = {
    Name = "ec2_security_group"
  }

}