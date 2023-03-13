locals {
  project = "ignite-server"

  cidr_block  = ["172.31.16.0/20", "172.31.32.0/20"]

  # Subnet IDs of the server load balancer
  subnets_ids = [
    aws_subnet.server_lb[0].id,
    aws_subnet.server_lb[1].id
  ]

}

data "aws_availability_zones" "zones" {
  state = "available"
}

resource "aws_vpc" "project" {
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "project"
  }
}

resource "aws_subnet" "server_lb" {
  count                   = length(local.cidr_block)
  vpc_id                  = aws_vpc.project.id
  cidr_block              = local.cidr_block[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.zones.names[count.index]

  tags = {
    Name = "server-lb"
  }
}

resource "aws_internet_gateway" "project" {
  vpc_id = aws_vpc.project.id

  tags = {
    Name = "project"
  }
}

resource "aws_route_table" "server_lb" {
  vpc_id = aws_vpc.project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project.id
  }
}

resource "aws_route_table_association" "public" {
  count          = length(local.subnets_ids)
  route_table_id = aws_route_table.server_lb.id
  subnet_id      = local.subnets_ids[count.index]
}