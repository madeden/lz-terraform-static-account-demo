resource "aws_s3_bucket" "terraform-website-bucket" {
  bucket = "${var.terraform_website_bucket}"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

data "aws_iam_policy_document" "read-with-secret-policy" {
  statement {
    sid       = "1"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.terraform_website_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test = "StringEquals"
      variable = "aws:UserAgent"
      values = ["${var.secret}"]
    }
  }
}

resource "aws_s3_bucket_policy" "website-bucket-read-with-secret" {
  bucket = "${aws_s3_bucket.terraform_website_bucket.id}"
  policy = "${data.aws_iam_policy_document.read-with-secret-policy.json}"
}


