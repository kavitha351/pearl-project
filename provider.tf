# Configure the AWS Provider before using the terrafrom AWS resources.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">=1.2.0"
}
provider "aws" {
  region     = "us-east-1"
  access_key = "{access-key-id}"
  secret_key = "{secret-access-key}"
  #terrafomr lady
}