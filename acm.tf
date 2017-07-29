data "aws_acm_certificate" "ledvina-farm" {
  provider = "aws.east"
  domain   = "${var.domain}"
  statuses = ["ISSUED"]
}
