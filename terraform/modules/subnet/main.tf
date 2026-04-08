resource "aws_subnet" "subneta" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subneta_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = var.subneta_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.subneta_name}-igw"
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.subneta_name}-rt1"
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.subneta.id
  route_table_id = aws_route_table.rt1.id  
}