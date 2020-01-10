# Main region
variable "aws_profile" {
  description = "The AWS profile to use"
  default     = "REPLACE-ME"
}

variable "aws_region" {
  description = "The AWS region to create things in"
  default     = "eu-west-1"
}

# State bucket goes in the main region
variable "terraform_state_bucket" {
  description = "ID of the storing-state bucket"
  default     = "REPLACE-ME"
}

# Replica region
variable "replica_aws_profile" {
  description = "The AWS profile to use for replication"
  default     = "REPLACE-ME"
}

variable "aws_region_replica" {
  description = "The AWS region for DR"
  default     = "us-west-1"
}

variable "terraform_state_bucket" {
  description = "ID of the storing-state bucket"
  default     = "REPLACE-ME"
}

# The replica name of the bucket will be this one plus -replica
variable "terraform_website_bucket" {
  description = "ID of the bucket storing the website static files"
  default     = "REPLACE-ME"
}

provider "aws" {
  alias   = "main"
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

provider "aws" {
  alias   = "replica"
  region  = "${var.aws_region_replica}"
  profile = "${var.replica_aws_profile}"
}
