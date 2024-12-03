provider "aws" {
  region = "us-east-1" # Specify your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0166fe664262f664c" # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformExampleInstance"
  }

  # Optional: Create a new security group for the instance
  vpc_security_group_ids = [aws_security_group.sg.id]

  # Optional: Create a new key pair for SSH access
  key_name = "tfkey"
}

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
