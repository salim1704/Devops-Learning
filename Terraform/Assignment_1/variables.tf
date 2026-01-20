#EC2 Module Variables

variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "Instance type for EC2 instance"
  type        = string
}


#VPC Module Variables

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
    description = "CIDR block for the public subnet"
    type        = string 
}

variable "private_subnet_cidr" {
    description = "CIDR block for the private subnet"
    type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}


