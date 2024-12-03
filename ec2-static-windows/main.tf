provider "aws" {
  region = "us-east-1" # Specify your desired AWS region
}

# Security group
resource "aws_security_group" "sg" {
  name        = "terraform-windows-sg"
  description = "Allow RDP access"

  ingress {
    from_port   = 3389 # RDP port
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict this to your IP for better security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Windows EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0d0e8b294f5fa3e60" # Replace with a valid Windows AMI ID for your region
  instance_type = "t2.micro"

  key_name               = "tfkey"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "TerraformWindowsInstance"
  }
}

 # EBS volume
resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.example.availability_zone
  size              = 30 # Increased size for Windows

  tags = {
    Name = "TerraformWindowsVolume"
  }
}

# Attach the EBS volume to the instance
resource "aws_volume_attachment" "example" {
  device_name = "/dev/xvdf" # Device name for the volume on the instance
  instance_id = aws_instance.example.id
  volume_id   = aws_ebs_volume.example.id
} 
