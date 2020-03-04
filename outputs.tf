output "reachable_other_host_ip_address" {
  description = "The IP address of the reachable_other_host instance"
  value       = aws_instance.reachable_other_host.public_ip
}


output "reachable_other_host_id" {
  description = "The id of the reachable_other_host instance"
  value       = aws_instance.reachable_other_host.id
}

output "remote_group_public_dns" {
  description = "The list of public DNS names of the remote_group instances"
  value       = aws_instance.remote_group.*.public_dns
}

output "test_target_public_dns" {
  description = "The list of public DNS names assigned to the test_target instances"
  value       = [aws_instance.remote_group.*.public_dns]
}

output "test_target_ids" {
  description = "The list of public DNS names assigned to the test_target instances"
  value       = [aws_instance.remote_group.*.id]
}

output "security_group" {
  description = "The name of the security group"
  value       = aws_security_group.complex_tutorial.name
}

output "security_group_id" {
  description = "The name of the security group"
  value       = aws_security_group.complex_tutorial.id
}

output "vpc_id" {
  description = "The name of the security group"
  value       = aws_vpc.complex_tutorial.id
}

output "subnet_id" {
  description = "The name of the security group"
  value       = aws_subnet.complex_tutorial.id
}

output "ami_id" {
  description = "The name of the security group"
  value       = aws_instance.reachable_other_host.ami
}