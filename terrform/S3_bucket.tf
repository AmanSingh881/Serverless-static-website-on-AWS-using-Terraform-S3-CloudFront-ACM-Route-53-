# will create a unique id which enables us to create a unique name for S3 bucket
resource "random_id" "random_hex" {
  byte_length = 8  
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.7.0"


  bucket = format("%s.%s","mybucket",random_id.random_hex.hex)
  acl    = "private"


 # 🚫 Disable ALL forms of public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
    mfa_delete = false
  }

  # 🔐 Enable server-side encryption using the default AWS S3-managed key
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    terraform =  "True"
    Name        = "My bucket"
    Environment = "Dev"
  }
}