# VPC Resources
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = "default"
  tags = {
    Name = "wp-vpc"
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.public_subnet_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "private-subnet"
  }
}

# Internet Gateway and Route Table for Public Subnet
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "wp-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

