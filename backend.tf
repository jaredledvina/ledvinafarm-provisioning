terraform {
  backend "s3" {
    bucket         = "ledvinafarm-state"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "ledvinafarm-state-lock"
  }
}
