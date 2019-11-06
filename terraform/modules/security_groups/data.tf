data "terraform_remote_state" "remote_vpc" {

  backend = "s3"
  config {
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
    bucket  = "${var.backend_s3_bucket_name}"
    key     = "vpc/${var.account_name}/${var.aws_region}/${var.vpc_name}/terraform.tfstate"
  }
}

data "terraform_remote_state" "security_groups" {
  count = "${length(var.ingress_rules_source_security_group)}"

  backend = "s3"
  config {
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
    bucket  = "${var.backend_s3_bucket_name}"
    key     = "security_groups/${lookup(var.ingress_rules_source_security_group[count.index], "source_security_group")}/${var.account_name}/${var.aws_region}/${var.vpc_name}/terraform.tfstate"
  }
}

data "terraform_remote_state" "security_groups_ssh" {
  count = "${length(var.ingress_rules_ssh)}"

  backend = "s3"
  config {
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
    bucket  = "${var.backend_s3_bucket_name}"
    key     = "security_groups/${lookup(var.ingress_rules_ssh[count.index], "source_security_group")}/${var.account_name}/${var.aws_region}/${var.vpc_name}/terraform.tfstate"
  }
}