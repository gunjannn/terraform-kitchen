terraform {
  # The configuration is restricted to Terraform versions supported by
  # Kitchen-Terraform
  required_version = ">= 0.11.4, <= 0.12.21"
}

provider "aws" {
  version = "~> 2.0"
  region = var.region
}

provider "random" {
  version = "~> 2.1.0"
}

# These aws_instances will be targeted with the operating_system control and the
# reachable_other_host control
resource "aws_instance" "remote_group" {
  ami           = var.instances_ami
  count         = 2
  instance_type = "t2.micro"
  key_name      = aws_key_pair.complex_tutorial.key_name
  subnet_id     = aws_subnet.complex_tutorial.id

  tags = {
    Name      = "kitchen-terraform-test-target-1"
    Terraform = "true"
  }

  vpc_security_group_ids = [aws_security_group.complex_tutorial.id]
}

# The reachable_other_host control will attempt to connect to this aws_instance
# from each of the remote_group aws_instances which will verify the configuration
# of the associated aws_security_group
resource "aws_instance" "reachable_other_host" {
  ami                         = var.instances_ami
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.complex_tutorial.key_name
  subnet_id                   = aws_subnet.complex_tutorial.id

  tags = {
    Name      = "kitchen-terraform-reachable-other-host"
    Terraform = "true"
  }

  vpc_security_group_ids = [aws_security_group.complex_tutorial.id]
}

resource "aws_key_pair" "complex_tutorial" {
  key_name = "kitchen-terraform-${random_string.key_name.result}"

  public_key = var.key_pair_public_key
}

resource "random_string" "key_name" {
  length  = 9
  special = false
}

resource "aws_security_group" "complex_tutorial" {
  description = "Allow all inbound traffic"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    from_port = var.instance_port
    to_port   = var.instance_port
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = "443"
    to_port   = "443"
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  name = "kitchen-terraform-complex_tutorial"

  tags = {
    Name      = "kitchen-terraform-complex_tutorial"
    Terraform = "true"
  }

  vpc_id = aws_vpc.complex_tutorial.id
}

resource "aws_route_table_association" "complex_tutorial" {
  route_table_id = aws_route_table.complex_tutorial.id
  subnet_id      = aws_subnet.complex_tutorial.id
}

resource "aws_route_table" "complex_tutorial" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.complex_tutorial.id
  }

  tags = {
    Name = "kitchen_terraform_complex_tutorial"
  }

  vpc_id = aws_vpc.complex_tutorial.id
}

resource "aws_internet_gateway" "complex_tutorial" {
  tags = {
    Name = "kitchen_terraform_complex_tutorial"
  }

  vpc_id = aws_vpc.complex_tutorial.id
}

resource "aws_subnet" "complex_tutorial" {
  availability_zone       = var.subnet_availability_zone
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "kitchen_terraform_complex_tutorial"
  }

  vpc_id = aws_vpc.complex_tutorial.id
}

resource "aws_vpc" "complex_tutorial" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "kitchen_terraform_complex_tutorial"
  }
}
