resource "aws_eip" "eip" {
  count = length(var.public_cidr)
  vpc      = true
}