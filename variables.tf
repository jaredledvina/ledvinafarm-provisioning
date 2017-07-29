variable "aws_access_key" {
  type        = "string"
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  type        = "string"
  description = "AWS Secret Key"
}

variable "region" {
  type        = "string"
  description = "AWS Region"
  default     = "us-east-2"
}

variable "website-bucket" {
  type        = "string"
  description = "Name of the S3 bucket to store website files"
  default     = "ledvina-farm"
}

variable "domain" {
  type        = "string"
  description = "The domain used for everything"
  default     = "ledvina.farm"
}

