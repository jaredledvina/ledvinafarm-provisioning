provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
  version    = "~> 1.13.0"
}

provider "aws" {
  alias      = "east"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
  version    = "~> 1.13.0"
}

provider "awscreds" {
  region = "${var.region}"
}
