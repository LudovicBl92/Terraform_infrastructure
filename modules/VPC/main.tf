resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    tags = {
        Name = var.name_vpc
    }
}
resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = "${aws_vpc.main.id}"
    tags = {
        Name = var.internet_gateway
    }
}
resource "aws_route_table" "IG_route_table" {
    vpc_id = "${aws_vpc.main.id}"

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
    }
    tags = {
        Name = var.internet_gateway
    }
}
resource "aws_subnet" "primary-subnet" {
    vpc_id             = "${aws_vpc.main.id}"
    cidr_block         = var.cidr_block_subnet1
    availability_zone  = var.AZ-1
    tags = {
        Name = var.primary-subnet
    }
}

resource "aws_subnet" "second-subnet" {
    vpc_id             = "${aws_vpc.main.id}"
    cidr_block         = var.cidr_block_subnet2
    availability_zone  = var.AZ-2

    tags = {
        Name = var.second-subnet
    }
}

/*
resource "aws_route_table_association" "Public_route1" {
    subnet_id = "${aws_subnet.Pub_Network-PROD.id}"
    route_table_id = "${aws_route_table.Internet_Gateway.id}"
}
resource "aws_route_table_association" "Public_route2" {
    subnet_id = "${aws_subnet.Pub_Network-BACK.id}"
    route_table_id = "${aws_route_table.Internet_Gateway.id}"
}
*/