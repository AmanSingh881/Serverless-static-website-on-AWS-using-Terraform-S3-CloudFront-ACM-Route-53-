data "aws_acm_certificate" "example_cert" {
  domain   = var.domain_name
  statuses = ["ISSUED"]
  most_recent = true

  tags = var.acm_tags
}

output "certificate_arn" {
  value = data.aws_acm_certificate.example_cert.arn
}