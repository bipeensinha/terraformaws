variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment name"
  default     = "Dev"
}
