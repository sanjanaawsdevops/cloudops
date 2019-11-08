provider "aws" {
  region         = var.region
  profile        = var.profile
}

# terraform.tf
terraform {
 backend "s3"  {
 }
}