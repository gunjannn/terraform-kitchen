module "complex_kitchen_terraform" {
  instances_ami = var.instances_ami
  instance_port = var.instance_port
  # The generated key pair will be used to configure SSH authentication
  key_pair_public_key = "${file("${path.module}/../../assets/id_rsa.pub")}"

  # The source of the module is the root directory of the Terraform project
  source                   = "../../../"
  subnet_availability_zone = var.subnet_availability_zone
  region = var.region
}
