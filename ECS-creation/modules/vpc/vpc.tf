
resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = var.tenancy
  tags = {
    Name = var.vpc-name
  }
}

resource "aws_subnet" "subnet-public" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet-public-cidr
  availability_zone = var.az-1
  tags = {
    Name = var.subnet-public-name
  }
}

resource "aws_subnet" "subnet-private-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet-private-cidr-1
  availability_zone = var.az-2
  tags = {
    Name = var.subnet-private-name-1
  }
}

resource "aws_subnet" "subnet-private-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet-private-cidr-2
  availability_zone = var.az-1
  tags = {
    Name = var.subnet-private-name-2
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.igw-name
  }
}

resource "aws_nat_gateway" "subnet-public-natgateway" {
  allocation_id = aws_eip.elastic_ip_1.id
  subnet_id     = aws_subnet.subnet-public.id

  tags = {
    Name = "natgateway-subnet-public"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "elastic_ip_1" {
  vpc              = true
  public_ipv4_pool = "amazon"
}


resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.net-cidr
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.rt-public-subnet
  }
}

resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = var.net-cidr
    nat_gateway_id = aws_nat_gateway.subnet-public-natgateway.id
  }

  tags = {
    Name = var.rt-private-subnet
  }
}

resource "aws_route_table_association" "public-subnet-association" {
  subnet_id      = aws_subnet.subnet-public.id
  route_table_id = aws_route_table.rt-public.id
}

resource "aws_route_table_association" "private-subnet-association-1" {
  subnet_id      = aws_subnet.subnet-private-1.id
  route_table_id = aws_route_table.rt-private.id
}

resource "aws_route_table_association" "private-subnet-association-2" {
  subnet_id      = aws_subnet.subnet-private-2.id
  route_table_id = aws_route_table.rt-private.id
}
