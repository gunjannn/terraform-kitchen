output "reachable_other_host_ip_address" {
  description = <<EOD
This output is used as an attribute in the reachable_other_host control
EOD

  value = <<EOV
${module.complex_kitchen_terraform.reachable_other_host_ip_address}
EOV
}

output "static_terraform_output" {
  description = <<EOD
This output is used as an attribute in the inspec_attributes control
EOD

  value = "static terraform output"
}

output "terraform_state" {
  description = "This output is used as an attribute in the state_file control"

  value = <<EOV
${path.cwd}/terraform.tfstate.d/${terraform.workspace}/terraform.tfstate
EOV
}

output "remote_group_public_dns" {
  description = "This output is used to obtain targets for InSpec"

  value = module.complex_kitchen_terraform.remote_group_public_dns
}

output "security_group" {
  description = "The name of the security group"
  value       = module.complex_kitchen_terraform.security_group.name
}

output "security_group_id" {
  description = "The name of the security group"
  value       = module.complex_kitchen_terraform.security_group_id
}

output "vpc_id" {
  description = "The name of the security group"
  value       = module.complex_kitchen_terraform.vpc_id
}

output "subnet_id" {
  description = "The name of the security group"
  value       = module.complex_kitchen_terraform.subnet_id
}

output "ami_id" {
  description = "The name of the security group"
  value       = module.complex_kitchen_terraform.ami_id
}

output "reachable_other_host_id" {
  description = "The id of the reachable_other_host instance"
  value       = module.complex_kitchen_terraform.reachable_other_host_id
}


output "test_target_ids" {
  description = "The list of public DNS names assigned to the test_target instances"
  value       = [module.complex_kitchen_terraform.test_target_ids]
}


output "test_target_public_dns" {
  description = "This output is used to obtain targets for InSpec"
  value       = [module.complex_kitchen_terraform.test_target_public_dns]
}
