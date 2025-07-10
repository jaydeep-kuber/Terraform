# key pair 
resource "aws_key_pair" "terra-key-ec2" {
  key_name = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}

# VPC & SG
resource "aws_default_vpc" "default" {
  
}

# SG
resource "aws_security_group" "terra-sg" {
  name = "terra-sg"
  description = "Security group for terra EC2 instance"
  vpc_id = aws_default_vpc.default.id # interpolation

  # inbound rules
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH, TF created"
  }    
  # outbound rules
  egress {
    from_port = 0
    to_port = 0 
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic, TF created"
  }
  tags = {
    Name = "terra-sg"
  }
}

# EC2 Instance
resource "aws_instance" "TF-ec" {
    key_name = aws_key_pair.terra-key-ec2.key_name
    security_groups = [aws_security_group.terra-sg.name]
    instance_type = "t2.micro"
    ami = "ami-0f918f7e67a3323f0" # Ubuntu 24.04 LTS in ap-south-1 region

    tags = {
        Name = "create-by-terra"
    }

    root_block_device {
      volume_size = 8 # Size in GB
      volume_type = "gp2" # General Purpose SSD
    }
}