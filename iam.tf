data "aws_iam_policy_document" "website-bucket-read" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.website-bucket}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_iam_user" "circleci" {
  name = "ledvina-farm-website-circleci"
}

data "aws_iam_policy_document" "bucket-read-access" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

data "aws_iam_policy_document" "blogupdater" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:ListBucket",
      "s3:ListAllMyBuckets",
      "s3:GetObjectAcl",
      "s3:GetObject",
      "s3:GetBucketLocation",
      "s3:GetBucketAcl",
      "s3:DeleteObject",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.website-bucket.id}/*",
      "arn:aws:s3:::${aws_s3_bucket.website-bucket.id}",
    ]
  }
}

resource "aws_iam_user_policy" "blogupdater" {
  name   = "blogupdater"
  user   = "${aws_iam_user.circleci.name}"
  policy = "${data.aws_iam_policy_document.blogupdater.json}"
}

resource "aws_iam_access_key" "circleci-key" {
  user    = "${aws_iam_user.circleci.name}"
  pgp_key = "keybase:jledvina"
}

output "circleci-access" {
  value = "${aws_iam_access_key.circleci-key.id}"
}

output "circleci-secret" {
  value = "${aws_iam_access_key.circleci-key.encrypted_secret}"
}
