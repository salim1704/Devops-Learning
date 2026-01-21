variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "Instance type for EC2 instance"
  type        = string
}

variable "user_data" {
  description = "User data script for EC2 instance"
  type        = string
}
