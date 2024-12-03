provider "aws" {
  region = var.region
}

# Security group
resource "aws_security_group" "sg" {
  name        = "terraform-windows-sg"
  description = "Allow RDP access"

  ingress {
    from_port   = 3389 # RDP port
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = var.rdp_allowed_ips
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
  ami           = var.windows_ami
  instance_type = var.instance_type

  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = var.instance_name
  }
}

# EBS volume
resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.example.availability_zone
  size              = var.volume_size

  tags = {
    Name = var.volume_name
  }
}

# Attach the EBS volume to the instance
resource "aws_volume_attachment" "example" {
  device_name = "/dev/xvdf" # Device name for the volume on the instance
  instance_id = aws_instance.example.id
  volume_id   = aws_ebs_volume.example.id
}
