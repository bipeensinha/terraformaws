variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "windows_ami" {
  description = "Windows AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "rdp_allowed_ips" {
  description = "CIDR blocks allowed to access RDP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instance_name" {
  description = "Tag for the EC2 instance"
  type        = string
  default     = "TerraformWindowsInstance"
}

variable "volume_size" {
  description = "Size of the EBS volume in GiB"
  type        = number
  default     = 30
}

variable "volume_name" {
  description = "Tag for the EBS volume"
  type        = string
  default     = "TerraformWindowsVolume"
}
