# ℹ️ Description
# Specifies the AWS network.

# 📚 AWS VPC
# Generates a VPC with a public and private subnet.
resource "aws_default_vpc" "server" {
  tags = {
    Name = var.project
  }
}

resource "aws_internet_gateway" "server" {
  vpc_id = aws_default_vpc.server.id
  tags   = {
    Name = var.project
  }
}

resource "aws_default_subnet" "subnet_a" {
  availability_zone = "us-east-1a"
  tags              = {
    Name = "${var.project}_a"
  }
}

resource "aws_default_subnet" "subnet_b" {
  availability_zone = "us-east-1b"
  tags              = {
    Name = "${var.project}_b"
  }
}

resource "aws_default_subnet" "subnet_c" {
  availability_zone = "us-east-1c"
  tags              = {
    Name = "${var.project}_c"
  }
}

#resource "aws_route_table" "server" {
#  vpc_id = aws_vpc.server.id
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.server.id
#  }
#
#  tags = {
#    Name = var.project
#  }
#}
#
#resource "aws_route_table_association" "public_a" {
#  subnet_id      = aws_subnet.subnet_a.id
#  route_table_id = aws_route_table.server.id
#}
#
#resource "aws_route_table_association" "public_b" {
#  subnet_id      = aws_subnet.subnet_b.id
#  route_table_id = aws_route_table.server.id
#}
