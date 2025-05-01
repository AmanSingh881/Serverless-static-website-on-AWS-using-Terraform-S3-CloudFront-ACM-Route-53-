domain_name = "amansingh.xyz"

# acm varibles  Note: make sure you have this tags on your certificate, if not create it manually.
acm_tags = {
    "terraform" = true
  }

# cloudfront varibales
cloudfront_aliases = "amansingh.xyz"
cloudfront_default_root_object = "website/index.html"
cloudfront_tags = {
    "created_by" = "terraform"
    Env = "Dev"
}

#S3 bucket variables
s3_bucket_name = "s3.terraform"
S3_tags = {
    "created_by" = "terraform"
    Env = "Dev"
}
