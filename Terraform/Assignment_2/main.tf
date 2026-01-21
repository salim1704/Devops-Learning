# EC2 Module

module "ec2_instance" {
    source = "./modules/ec2"
    ec2_ami = var.ec2_ami
    ec2_instance_type = var.ec2_instance_type
    user_data = file("userdata.yml")
}