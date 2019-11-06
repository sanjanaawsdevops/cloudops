output "security_group_id" {
  description   = "Prints Security Group ID."
  value         = "${aws_security_group.security_group.id}"
}

output "security_group_description" {
  description   = "Description of the security group"
  value         = "${var.sg_description}"
}