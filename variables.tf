variable "instances_ami" {
  description = "The Amazon Machine Image (AMI) to use for the AWS EC2 instances"
  type        = string
}

variable "key_pair_public_key" {
  description = <<EOD
The public key material to use for SSH authentication with the instances
EOD

  type = string
}

variable "subnet_availability_zone" {
  description = "The isolated, regional location in which to place the subnet"
  type        = string
}

variable "instance_port" {
  description = "Port to be used for the http communication"
  type = string
}

variable "region" {
  description = "AWS region"
  type = string
}