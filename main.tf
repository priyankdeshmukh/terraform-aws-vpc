resource "aws_vpc" "test_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy

  tags = {
    Name = "practice"
  }
}

resource "aws_subnet" "test_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = "true"

  tags = {
    Name = "practice"
  }
}

output "vpc_id" {
  value = aws_vpc.test_vpc.id
}

output "subnet_id" {
  value = aws_subnet.test_subnet.id
}


resource "aws_internet_gateway" "test_gateway" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "practice"
  }
}


resource "aws_route_table" "test_route_table" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_gateway.id
  }


  tags = {
    Name = "practice"
  }
}


resource "aws_main_route_table_association" "test_route_table_asso" {
  vpc_id         = aws_vpc.test_vpc.id
  route_table_id = aws_route_table.test_route_table.id
}
