variable "s3_bucket_name" {
  default = "terraform"
  type = string
  description = "name of S3 bucket"
}

variable "S3_tags" {
  default = {
    "created_by" = "terraform"
    Env = "Dev"
  }
  type = map(string)
  description = "tags for s3"
}