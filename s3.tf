resource "aws_s3_bucket" "ledvinafarm_state" {
  bucket = "ledvinafarm-state"
  acl    = "private"

  versioning {
    enabled = "true"
  }
}

resource "aws_s3_bucket" "logging" {
  bucket = "ledvina-farm-s3-logs"
  acl    = "log-delivery-write"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "website-bucket" {
  bucket = "${var.website-bucket}"
  policy = "${data.aws_iam_policy_document.website-bucket-read.json}"

  versioning {
    enabled = "true"
  }

  logging {
    target_bucket = "${aws_s3_bucket.logging.id}"
    target_prefix = "ledvina-farm-website/"
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}
