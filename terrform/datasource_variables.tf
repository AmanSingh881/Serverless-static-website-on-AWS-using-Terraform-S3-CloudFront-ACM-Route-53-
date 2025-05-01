variable "domain_name" {
  default = "example.com"
  type = string
  description = "this with be the domain name"
}

variable "acm_tags" {
  default = {
    "created_by" = "terraform"
    Env = "Dev"
  }
  type = map(string)
  description = "this is to differentiate your certificate with others"
}