region        = "us-east-1"
windows_ami   = "ami-0d0e8b294f5fa3e60" # Replace with a valid Windows AMI ID
key_name      = "tfkey"
rdp_allowed_ips = ["0.0.0.0/0"] # Restrict this to your IP for better security
instance_name = "MyWindowsVM"
volume_size   = 50
volume_name   = "MyWindowsVolume"
