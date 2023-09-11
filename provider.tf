terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}

variable "aws_access_key" {}
variable "aws_secret_access_key" {}


provider "aws" {
  region = "ap-northeast-2"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}


# Terraform Backend Configuration
terraform {
  backend "s3" {
    bucket = "an-tf-bckup"
    key    = "tf-code/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

