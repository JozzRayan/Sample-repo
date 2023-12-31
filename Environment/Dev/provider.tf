terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}



provider "aws" {
  region = "ap-northeast-2"
  
}


# Terraform Backend Configuration
terraform {
  backend "s3" {
    bucket = "my-tf-bucket14"
    key    = "tf-code/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

