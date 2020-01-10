# State bucket is stored in the main region
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "${var.terraform_state_bucket}"
  acl    = "private"
  region = "${var.aws_region}"

  versioning {
    enabled = true
  }
}
