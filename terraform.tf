terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
backend "s3" {

bucket = "my-tf-test-bucket-526"
key =  "terraform.tfstate"
region=  "ap-south-1"
dynamodb_table =  "My_table"

}

}
