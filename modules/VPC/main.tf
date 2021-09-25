resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.name_vpc
  }
}
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.internet_gateway
  }
}
resource "aws_route_table" "IG_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = var.internet_gateway
  }
}
resource "aws_subnet" "primary-subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr_block_subnet1
  availability_zone       = var.AZ-1
  map_public_ip_on_launch = true

  tags = {
    Name = var.primary-subnet
  }
}
resource "aws_subnet" "second-subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr_block_subnet2
  availability_zone       = var.AZ-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.second-subnet
  }
}
resource "aws_route_table_association" "Public_route1" {
  subnet_id      = aws_subnet.primary-subnet.id
  route_table_id = aws_route_table.IG_route_table.id
}
resource "aws_route_table_association" "Public_route2" {
  subnet_id      = aws_subnet.second-subnet.id
  route_table_id = aws_route_table.IG_route_table.id
}
resource "aws_subnet" "third-subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr_block_subnet3
  availability_zone = var.AZ-2

  tags = {
    Name = var.third-subnet
  }
}

resource "aws_subnet" "fourth-subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr_block_subnet4
  availability_zone = var.AZ-3

  tags = {
    Name = var.fourth-subnet
  }
}
resource "aws_eip" "NAT_EIP" {
  vpc = true

  tags = {
    Name = var.nat_eip
  }
}
resource "aws_nat_gateway" "NAT_GW" {
  allocation_id = aws_eip.NAT_EIP.id
  subnet_id     = aws_subnet.third-subnet.id

  tags = {
    Name = var.nat_gateway
  }
}

resource "aws_route_table" "Private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT_GW.id
  }

  tags = {
    Name = "NAT_Gateway_Rule"
  }
}

resource "aws_route_table_association" "Private_route" {
  subnet_id      = aws_subnet.third-subnet.id
  route_table_id = aws_route_table.Private_route_table.id
}

resource "aws_eip" "NAT_EIP2" {
  vpc = true

  tags = {
    Name = var.nat_eip_back
  }
}
resource "aws_nat_gateway" "NAT_GW2" {
  allocation_id = aws_eip.NAT_EIP2.id
  subnet_id     = aws_subnet.fourth-subnet.id

  tags = {
    Name = var.nat_gateway_back
  }
}

resource "aws_route_table" "Private_route_table2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT_GW2.id
  }

  tags = {
    Name = "NAT_Gateway_Rule"
  }
}
resource "aws_route_table_association" "Private_route2" {
  subnet_id      = aws_subnet.fourth-subnet.id
  route_table_id = aws_route_table.Private_route_table.id
}