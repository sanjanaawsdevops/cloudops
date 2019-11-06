resource "aws_subnet" "public" {
  count             = length(var.public_cidr)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_cidr[count.index]
  availability_zone = var.availability_zone_names[count.index]

  tags = {
    Name = "Public-${var.availability_zone_names[count.index]}-${var.vpc_name}"
  }
}

resource "aws_subnet" "private" {
  count              = length(var.private_cidr)
  vpc_id             = aws_vpc.vpc.id
  cidr_block         = var.private_cidr[count.index]
  availability_zone  = var.availability_zone_names[count.index]

  tags = {
    Name = "Private-${var.availability_zone_names[count.index]}-${var.vpc_name}"
  }
}