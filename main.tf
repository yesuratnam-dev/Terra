terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-west-1"
}

module "aws_s3_bucket" {

    source = "./s3"
  
}

module "aws_vpc" {

  source = "./vpc"
  
}

module "lambda" {

  source = "./lambda"
  
}