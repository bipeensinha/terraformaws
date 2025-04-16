# AKIAQN2S3C27KX6TOG5I

# l1um5jG2RPjJp55C2jSqozMEmVPdodb+TGxwo/0M


provider "aws" {
  region = "us-west-2"
}

# Create the S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "bipeen-bucket-tf"
}


