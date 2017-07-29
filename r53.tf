resource "aws_route53_delegation_set" "main" {
  reference_name = "main"
}

resource "aws_route53_zone" "domain" {
  delegation_set_id = "${aws_route53_delegation_set.main.id}"
  name              = "${var.domain}"
}

resource "aws_route53_record" "a_ledvina_farm" {
  zone_id = "${aws_route53_zone.domain.zone_id}"
  name    = "${aws_route53_zone.domain.name}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.website_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.website_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "aaaa_ledvina_farm" {
  zone_id = "${aws_route53_zone.domain.zone_id}"
  name    = "${aws_route53_zone.domain.name}"
  type    = "AAAA"

  alias {
    name                   = "${aws_cloudfront_distribution.website_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.website_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}
