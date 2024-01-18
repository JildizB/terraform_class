resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags       = local.tags
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${local.region}a"

  tags = local.tags
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${local.region}b"

  tags = local.tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = local.tags
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = local.tags
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_eip" "nat_gateway" {
  vpc = true
}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = local.tags

  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table" "nat" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = local.tags
}

resource "aws_route_table_association" "nat-rt" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.nat.id
}

# new changes
