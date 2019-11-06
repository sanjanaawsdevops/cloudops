#Public Route Table 
resource "aws_route_table" "public" {
  vpc_id        = aws_vpc.vpc.id

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-${var.vpc_name}"
  }
}



#Private Route Table
resource "aws_route_table" "private" {
  count     = length(var.private_cidr)
  vpc_id    = aws_vpc.vpc.id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = element(aws_nat_gateway.nat[*].id, count.index)
  }
  tags = {
    Name = "private-${var.availability_zone_names[count.index]}-${var.vpc_name}"
  }
}



# 
resource "aws_route_table_association" "public" {
  count           = length(var.public_cidr)
  subnet_id       = element(aws_subnet.public[*].id, count.index)
  route_table_id  = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count           = length(var.private_cidr)
  subnet_id       = element(aws_subnet.private[*].id, count.index)
  route_table_id  = element(aws_route_table.private[*].id, count.index)
}