data "terraform_remote_state" "tf-remote-state" {
  backend = "s3"

  config = {
    bucket  = "${var.terraform_state_bucket}"
    key     = "tfstate/terraform.tfstate"
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
  }
}
