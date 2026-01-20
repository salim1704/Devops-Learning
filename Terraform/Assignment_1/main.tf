# VPC Module

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  region = var.region
}

# EC2 Module

module "ec2_instance" {
    source = "./modules/ec2"
    ec2_ami = var.ec2_ami
    ec2_instance_type = var.ec2_instance_type
    subnet_id = module.vpc.public_subnet_id
    vpc_id = module.vpc.vpc_id
    user_data = file("userdata.sh")
}