data "aws_iam_policy_document" "cloudfront_s3_policy" {
    version = "2008-10-17"
  
    statement {
      sid    = "AllowCloudFrontServicePrincipal"
      effect = "Allow"
  
      principals {
        type        = "Service"
        identifiers = [
          "cloudfront.amazonaws.com"
        ]
      }
  
      actions = [
        "s3:GetObject"
      ]
  
      resources = [
        "${module.s3_bucket.s3_bucket_arn}/*"
      ]
  
      condition {
        test     = "StringEquals"
        variable = "AWS:SourceArn"
        values = [module.cloudfront.cloudfront_distribution_arn]
      }
    }
  }
  