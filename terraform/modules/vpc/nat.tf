resource "aws_nat_gateway" "nat" {
  count         = length(var.public_cidr)
  allocation_id = element(aws_eip.eip[*].id, count.index)
  subnet_id     = element(aws_subnet.public[*].id, count.index)

  tags = {
    Name = "${var.vpc_name}-${var.availability_zone_names[count.index]}"

  }
}