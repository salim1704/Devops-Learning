variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "Instance type for EC2 instance"
  type        = string
}

variable "vpc_id" { 
  description = "VPC ID where the EC2 instance will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be deployed"
  type        = string
}

variable "user_data" {
  description = "User data script for EC2 instance"
  type        = string
}
