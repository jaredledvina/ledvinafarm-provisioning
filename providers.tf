provider "aws" {
  region  = "${var.region}"
  version = "~> 1.54.0"
}

provider "aws" {
  alias   = "east"
  region  = "us-east-1"
  version = "~> 1.54.0"
}
