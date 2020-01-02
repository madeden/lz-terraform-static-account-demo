resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "${var.terraform_state_bucket}"
  acl    = "private"

  versioning {
    enabled = true
  }
}
