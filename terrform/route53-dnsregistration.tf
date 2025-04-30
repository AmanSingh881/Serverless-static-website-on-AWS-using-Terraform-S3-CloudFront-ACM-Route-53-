# DNS Registration 
resource "aws_route53_record" "apps_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id 
  name    = ""
  type    = "A"
  alias {
    name                   = module.cloudfront.cloudfront_distribution_domain_name
    zone_id                = module.cloudfront.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = true
  }  
}