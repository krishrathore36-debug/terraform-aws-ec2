#Key Pair (Login)

resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}

# VPC and Security Group
resource "aws_default_vpc" "default" {

}
resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
  description = "This will add a SG"
  vpc_id      = aws_default_vpc.default.id


  #Inbound Rules

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH OPEN"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP OPEN"
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "FLASK_APP"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All_access"
  }
  tags = {
    Name = "automate-sg"
  }
}

# EC2 Instance

# EC2 Instance

resource "aws_instance" "my_instance" {
  for_each = var.ec2_instances

  ami           = var.aws_instance_ami_id
  instance_type = each.value.instance_type

  root_block_device {
    volume_size = var.aws_instance_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = each.key
  }
}
