module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "4.1.0"
  aliases = ["amansingh.xyz"]
  comment = "CloudFront distribution for S3 bucket static content"
  default_root_object = "website/index.html"
  enabled = true

  # Price class
  price_class = "PriceClass_200" # North America, Europe, Asia, Middle East, and Africa

  # HTTP versions
  http_version = "http2"

create_origin_access_identity = true
  origin_access_identities = {
    s3_bucket_one = "My awesome CloudFront can access"
  }

  create_origin_access_control = true
  origin_access_control = {
    s3_oac = {
      description      = "CloudFront access to S3"
      origin_type      = "s3"
      signing_behavior = "always"
      signing_protocol = "sigv4"
    }
  }

  origin = {

    s3_oac = { # with origin access control settings (recommended)
      domain_name           = module.s3_bucket.s3_bucket_bucket_regional_domain_name
      origin_access_control = "s3_oac"
    }

  }

  # SSL certificate from ACM
  viewer_certificate = {
    acm_certificate_arn            = data.aws_acm_certificate.example_cert.arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
    cloudfront_default_certificate = false
  }
  default_cache_behavior = {
    target_origin_id       = "s3_oac"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = true
  }

  ordered_cache_behavior = [
    {
      path_pattern           = "/*"
      target_origin_id       = "s3_oac"
      viewer_protocol_policy = "redirect-to-https"

      allowed_methods = ["GET", "HEAD", "OPTIONS"]
      cached_methods  = ["GET", "HEAD"]
      compress        = true
      query_string    = true
    }
  ]

  tags = {
    Environment = "production"
    Project     = "cloudfront-s3"
  }
}