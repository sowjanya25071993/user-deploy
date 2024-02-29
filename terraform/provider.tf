terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
  backend "s3" {
    bucket = "sowjanyaaws-state-dev"
    key    = "catalogue"
    region = "us-east-1"
    dynamodb_table = "sowjanyaaws-locking-dev"
    
  }


}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
