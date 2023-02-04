provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Product     = "pagoefectivo"
      Environment = "dev"
      Squad       = "api-cips"
      Project     = "ratelimit"
      Owner       = "pe"

    }
  }
}

terraform {
  #
  # backend "s3" {}
  backend "s3" {
    bucket = "orbis.terraform.state"
    key    = "temp/terraform/temp/elastic-cache/terraform.state"
    region = "us-east-1"
  }
  required_version = ">= 0.12.0"
}