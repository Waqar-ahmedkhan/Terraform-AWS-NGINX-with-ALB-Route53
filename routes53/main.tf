data "aws_route53_zone" "selected" {
  name = var.zone_name
}

resource "aws_route53_record" "web" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "${var.record_name}.${var.zone_name}"
  type    = "A"

  alias {
    name                   = var.alb_dns
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}