# Global Variables ---------------------------------------
variable "aws_region" {
  description = "Enter the region id where the VPC resides."
}

variable "aws_profile" {
  description = "Enter the profile name specific to the account being used."
}

# Import Status Variables -------------------------------
variable "backend_s3_bucket_name" {
  description = "Enter the name of the backend S3 bucket."
}

variable "account_name" {
  description = "Enter the name of an AWS account."
}

variable "vpc_name" {
  description = "Enter the name of a VPC."
}

# Security Group ----------------------------------------
variable "sg_name" {
  description = "Enter a name for the security group."
}

variable "sg_description" {
  description = "Enter a description for the security group."
}

variable "ingress_rules_cidr" {
  type        = "list"
  description = "Enter all the respective ingress rules."
}

variable "ingress_rules_vpc" {
  type        = "list"
  description = "Enter all the respective ingress rules for the SGs VPC cidr."
}

variable "ingress_rules_source_security_group" {
  type        = "list"
  description = "Enter all the respective ingress rules."
}

variable "ingress_rules_ssh" {
  type        = "list"
  description = "Enter all the respective ssh ingress rules."
}

variable "ingress_rules_self" {
  type        = "list"
  description = "Enter all the respective ingress rules."
}

variable "egress_rules" {
  type        = "list"
  description = "Enter all the respective egress rules."
}

# Tags --------------------------------------------------
variable "creator" {
  description = "Enter your email ID."
}

variable "created_by" {
  description = "Enter the name of the tool used to create it. e.g: Terraform or Terragrunt."
    default   = "Terraform"
}

variable "security_groups" {
  description = "List (of 1) of a security group that needs to be added to a rule."
  type        = "list"
}