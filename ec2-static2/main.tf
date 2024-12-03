provider "aws" {
  region = "us-east-1" # Specify your desired AWS region
}

# Security group
resource "aws_security_group" "sg" {
  name        = "terraform-sg"
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0166fe664262f664c" # Replace with a valid AMI ID for your region
  instance_type = "t3.micro"

  tags = {
    Name = "TerraformExampleInstance"
  }

  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = "tfkey"
}

# EBS volume
resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.example.availability_zone
  size              = 10 # Size of the volume in GiB

  tags = {
    Name = "TerraformExampleVolume"
  }
}

# Attach the EBS volume to the instance
resource "aws_volume_attachment" "example" {
  device_name = "/dev/xvdf" # Device name for the volume on the instance
  instance_id = aws_instance.example.id
  volume_id   = aws_ebs_volume.example.id
}
