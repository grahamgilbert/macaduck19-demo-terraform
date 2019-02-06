provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "grahamgilbert-terraform"
    region  = "us-east-1"
    encrypt = "true"
    key     = "macaduck19demo/terraform_state"
  }
}
