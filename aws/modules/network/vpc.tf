resource "aws_default_vpc" "server" {}

resource "aws_internet_gateway" "server" {
  vpc_id = aws_default_vpc.server.id
}

resource "aws_route_table" "server" {
  vpc_id = aws_default_vpc.server.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.server.id
  }
}

resource "aws_default_subnet" "subnet_a" {
  availability_zone = "us-east-1a"
}

resource "aws_default_subnet" "subnet_b" {
  availability_zone = "us-east-1b"
}

resource "aws_default_subnet" "subnet_c" {
  availability_zone = "us-east-1c"
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_default_subnet.subnet_a.id
  route_table_id = aws_route_table.server.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_default_subnet.subnet_b.id
  route_table_id = aws_route_table.server.id
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_default_subnet.subnet_c.id
  route_table_id = aws_route_table.server.id
}
