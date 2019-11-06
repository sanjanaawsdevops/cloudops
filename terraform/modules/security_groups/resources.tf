resource "aws_security_group" "security_group" {
  name        = "${var.sg_name}"
  description = "${var.sg_description}"
  vpc_id     = "${data.terraform_remote_state.remote_vpc.vpc_id}"

  egress      = "${var.egress_rules}"

  tags {
    Name               = "${var.sg_name}"
    creator            = "${var.creator}"
    created_by         = "${var.created_by}"
  }
}

resource "aws_security_group_rule" "ingress_rules_cidr" {
  count = "${length(var.ingress_rules_cidr)}"

  type                     = "ingress"
  from_port                = "${lookup(var.ingress_rules_cidr[count.index], "from_port")}"
  to_port                  = "${lookup(var.ingress_rules_cidr[count.index], "to_port")}"
  protocol                 = "${lookup(var.ingress_rules_cidr[count.index], "protocol")}"
  cidr_blocks              = "${split(",", lookup(var.ingress_rules_cidr[count.index], "cidr_blocks"))}"
  description              = "${lookup(var.ingress_rules_cidr[count.index], "description")}"

  security_group_id        = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "ingress_rules_vpc_cidr" {
  count = "${length(var.ingress_rules_vpc)}"

  type                     = "ingress"
  from_port                = "${lookup(var.ingress_rules_vpc[count.index], "from_port")}"
  to_port                  = "${lookup(var.ingress_rules_vpc[count.index], "to_port")}"
  protocol                 = "${lookup(var.ingress_rules_vpc[count.index], "protocol")}"
  cidr_blocks              = ["${data.terraform_remote_state.remote_vpc.vpc_cidr_block}"]
  description              = "${var.vpc_name} VPC"

  security_group_id        = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "ingress_rules_source_security_group" {
  count = "${length(var.ingress_rules_source_security_group)}"

  type                     = "ingress"
  from_port                = "${lookup(var.ingress_rules_source_security_group[count.index], "from_port")}"
  to_port                  = "${lookup(var.ingress_rules_source_security_group[count.index], "to_port")}"
  protocol                 = "${lookup(var.ingress_rules_source_security_group[count.index], "protocol")}"
  source_security_group_id = "${element(data.terraform_remote_state.security_groups.*.security_group_id, count.index)}"
  description              = "${lookup(var.ingress_rules_source_security_group[count.index], "description")}"

  security_group_id        = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "ingress_rules_ssh" {
  count = "${length(var.ingress_rules_ssh)}"

  type                     = "ingress"
  from_port                = "22"
  to_port                  = "22"
  protocol                 = "tcp"
  source_security_group_id = "${element(data.terraform_remote_state.security_groups_ssh.*.security_group_id, count.index)}"
  description              = "${lookup(var.ingress_rules_ssh[count.index], "description")}"

  security_group_id        = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "ingress_rules_self" {
  count = "${length(var.ingress_rules_self)}"

  type                     = "ingress"
  from_port                = "${lookup(var.ingress_rules_self[count.index], "from_port")}"
  to_port                  = "${lookup(var.ingress_rules_self[count.index], "to_port")}"
  protocol                 = "${lookup(var.ingress_rules_self[count.index], "protocol")}"
  self                     = true
  description              = "Self"

  security_group_id        = "${aws_security_group.security_group.id}"
}

