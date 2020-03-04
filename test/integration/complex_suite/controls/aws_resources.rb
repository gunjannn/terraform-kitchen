vpc_id_kt = attribute('vpc_id', description: 'VPC ID')
ami_id_kt = attribute('ami_id', description: 'AMI ID used by the EC2 instance')
subnet_id_kt = attribute('subnet_id', description: 'Subnet ID')
reachable_other_host_id_kt = attribute('reachable_other_host_id', description: 'ID of the EC2 instance')
test_target_ids_kt = attribute('test_target_ids', decription: 'ID of the test target EC2 instances')
security_group_id_kt = attribute('security_group_id', description: 'Security group ID')
security_group_name_kt = attribute('security_group', description: 'Security group name')


control 'aws_resources' do
  describe aws_vpc(vpc_id_kt) do
    it { should exist }
    its('cidr_block') { should eq '192.168.0.0/16' }
  end

  describe aws_subnets.where( vpc_id: vpc_id_kt) do
    its('states') { should_not include 'pending' }
    its('cidr_blocks') { should include '192.168.1.0/24' }
    its('subnet_ids') { should include subnet_id_kt }
  end

    describe aws_security_group(group_id: security_group_id_kt) do
      it { should exist }
      #its('group_name') { should cmp security_group_name_kt}
      its('group_id') { should cmp security_group_id_kt}
      it { should allow_in(port: 22, ipv4_range: '198.144.101.2/32') }
      it { should allow_in(port: 22, ipv4_range: '73.61.21.227/32') }
      it { should allow_in(port: 443, ipv4_range: '198.144.101.2/32') }
      it { should allow_in(port: 443, ipv4_range: '73.61.21.227/32') }
      #it { should_not allow_in(port: 80, ipv4_range: '0.0.0.0/0') }
      its('inbound_rules.count') { should cmp 3 }
    end

  describe aws_ec2_instance(reachable_other_host_id_kt) do
    it { should exist }
    its('image_id') { should eq ami_id_kt }
    its('instance_type') { should eq 't2.micro' }
    its('vpc_id') {should eq vpc_id_kt}
    its('tags') { should include(key: 'Name', value: 'kitchen-terraform-reachable-other-host') }
  end

end