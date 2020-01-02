variable "aws_profile" {
  description = "The AWS profile to use"
  default     = "REPLACE-ME"
}

variable "aws_region" {
  description = "The AWS region to create things in"
  default     = "eu-west-1"
}

variable "terraform_state_bucket" {
  description = "ID of the storing-state bucket"
  default     = "REPLACE-ME"
}

variable "terraform_website_bucket" {
  description = "ID of the bucket storing the website static files"
  default     = "REPLACE-ME"
}

provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

terraform {
  backend "s3" {
    bucket  = "${var.terraform_state_bucket}"
    key     = "tfstate/terraform.tfstate"
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
  }
}

