# Global Variables ---------------------------
variable "region" {
  type        = "string"
  description = "Enter the region id where the VPC resides."
}

variable "profile" {
  type        = "string"
  description = "Enter the AWS profile name specific to the account being used."
}

# VPC Variables ------------------------------
variable "vpc_name" {
  type        = "string"
  description = "Enter the name of a VPC."
}

variable "vpc_cidr_block" {
  type        = "string"
  description = "Enter the cider block of the VPC."
}

# Subnet Variables --------------------------
variable "availability_zone_names" {
  type        = "list"
  description = "Enter all the respective availability zones."
}

variable "public_cidr" {
  type        = "list"
  description = "Enter all the respective public cidrs."
}

variable "private_cidr" {
  type        = "list"
  description = "Enter all the respective private cidrs."
}