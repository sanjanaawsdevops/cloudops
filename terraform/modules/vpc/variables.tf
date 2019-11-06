# Global Variables ---------------------------
variable "region" {
  type        = "string"
  description = "region"
}

variable "profile" {
  type        = "string"
  description = "user profile"
}

# VPC Variables ------------------------------
variable "vpc_name" {
  type        = "string"
  description = "name of vpc"
}

variable "vpc_cidr_block" {
  type        = "string"
  description = "cider block for vpc"
}

# Subnet Variables --------------------------
variable "availability_zone_names" {
  type        = "list"
  description = "az"
}

variable "public_cidr" {
  type        = "list"
  description = "public cider"
}

variable "private_cidr" {
  type        = "list"
  description = "public cider"
}