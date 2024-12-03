provider "aws" {
  region = "us-west-2"
}

# Create the S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "bipeen-bucket-tf"
}


