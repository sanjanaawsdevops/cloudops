resource "aws_vpc" "vpc" {
  #varavlize cidr block and name
  cidr_block       = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}