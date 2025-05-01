variable "cloudfront_aliases" {
  default = "example.com"
  type = string
  description = "this will initiate a connection between the route53 and cloudfront distribution"
}

variable "cloudfront_default_root_object" {
  default = "index.html"
  type = string
  description = "this will be the path of index.html"
}

variable "cloudfront_tags" {
  default = {
    "created_by" = "terraform"
    Env = "Dev"
  }
  type = map(string)
  description = "tags for cloudfront distribution"
}