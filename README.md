# Terraform Kitchen Example

An example kitchen-terraform project, which will build and 
test the following resources in AWS regions us-east-1 and us-west-2:

1. VPC
2. Subnet
3. Internet Gateway
4. Route Table
5. Route Table Association
6. Security Group
7. Key Pair
8. 2 X EC2 Instance


##Prerequisites

* Terraform 12
* Ruby
* Python3
* AWS account 
* AWS use with minimum of the following permissions

```bash
{
 "Version": "2012-10-17",
 "Statement":
   [
     {
       "Sid": "Stmt1469773655000",
       "Effect": "Allow",
       "Action": ["ec2:*"],
       "Resource": ["*"]
     }
   ]
}
```

## Setup the environment

Create a Python3 virutal environment, activate the environment, 
and install the python terraform-compliance module

```bash
which python3
/Library/Frameworks/Python.framework/Versions/3.8/bin/python3
cd ~
mkdir virtualenvs
cd virtualenvs
virtualenv terraform-test  -p /Library/Frameworks/Python.framework/Versions/3.8/bin/python3
source terraform-test/bin/activate
pip install terraform-compliance

```

Create a projects directory and download the sample code.

```bash
cd ~
mkdir projects
cd projects
git clone git@github.com:rubelw/terraform-kitchen.git
cd terraform-kitchen
```


Run the `execute_ktichen_terraform.sh` file to perform the following:
1. Install bundler
2. Install required gems
3. Create public and private key pair
4. Initialize terraform project
5. Test terraform plan output against terraform-compliance features
6. Execute kitchen test suite
    * kitchen destroy centos(us-east-1)
    * kitchen create centos(us-east-1)
    * kitchen converge centos(us-east-1)
    * kitchen verify centos (us-east-1)
    * kitchen destroy centos(us-east-1)
    * kitchen destroy ubuntu(us-west-2)
    * kitchen create ubuntu(us-west-2)
    * kitchen converge ubuntu(us-west-2)
    * kitchen verify ubuntu(us-west-2)
    * kitchen destroy ubuntu(us-west-2)    
    
The output should look something like the following:

```bash
(terraform-test) Williams-MBP:terraform-kitchen rubelw$ ./execute_kitchen_terraform.sh 
Successfully installed bundler-2.1.4
Parsing documentation for bundler-2.1.4
Done installing documentation for bundler after 2 seconds
1 gem installed
Fetching gem metadata from https://rubygems.org/.........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies....
Using concurrent-ruby 1.1.6
Using i18n 1.8.2
Using minitest 5.14.0
Using thread_safe 0.3.6
Using tzinfo 1.2.6
Using activesupport 5.2.4.1
Using public_suffix 4.0.3
Using addressable 2.7.0
Using aws-eventstream 1.0.3
Using aws-partitions 1.279.0
Using aws-sigv4 1.1.1
Using jmespath 1.4.0
Using aws-sdk-core 3.90.1
Using aws-sdk-apigateway 1.36.0
Using aws-sdk-apigatewayv2 1.15.0
Using aws-sdk-athena 1.22.0
Using aws-sdk-autoscaling 1.22.0
Using aws-sdk-budgets 1.27.0
Using aws-sdk-cloudformation 1.30.0
Using aws-sdk-cloudhsm 1.19.0
Using aws-sdk-cloudhsmv2 1.20.0
Using aws-sdk-cloudtrail 1.20.0
Using aws-sdk-cloudwatch 1.33.0
Using aws-sdk-cloudwatchlogs 1.28.0
Using aws-sdk-codecommit 1.30.0
Using aws-sdk-codedeploy 1.27.0
Using aws-sdk-codepipeline 1.28.0
Using aws-sdk-configservice 1.42.1
Using aws-sdk-costandusagereportservice 1.18.0
Using aws-sdk-dynamodb 1.44.0
Using aws-sdk-ec2 1.146.0
Using aws-sdk-ecr 1.25.0
Using aws-sdk-ecs 1.57.0
Using aws-sdk-eks 1.31.0
Using aws-sdk-elasticache 1.29.0
Using aws-sdk-elasticbeanstalk 1.26.0
Using aws-sdk-elasticloadbalancing 1.19.0
Using aws-sdk-elasticloadbalancingv2 1.40.1
Using aws-sdk-elasticsearchservice 1.30.0
Using aws-sdk-firehose 1.24.0
Using aws-sdk-iam 1.33.0
Using aws-sdk-kafka 1.18.0
Using aws-sdk-kinesis 1.20.0
Using aws-sdk-kms 1.29.0
Using aws-sdk-lambda 1.36.0
Using aws-sdk-organizations 1.17.0
Using aws-sdk-rds 1.78.0
Using aws-sdk-redshift 1.37.0
Using aws-sdk-route53 1.30.0
Using aws-sdk-route53domains 1.18.0
Using aws-sdk-route53resolver 1.11.0
Using aws-sdk-s3 1.60.2
Using aws-sdk-securityhub 1.19.0
Using aws-sdk-ses 1.27.0
Using aws-sdk-sms 1.17.0
Using aws-sdk-sns 1.21.0
Using aws-sdk-sqs 1.23.1
Using aws-sdk-ssm 1.71.0
Using multipart-post 2.1.1
Using faraday 0.17.3
Using unf_ext 0.0.7.2
Using unf 0.1.4
Using domain_name 0.5.20190701
Using http-cookie 1.0.3
Using faraday-cookie_jar 0.0.6
Using timeliness 0.3.10
Using ms_rest 0.7.5
Using ms_rest_azure 0.11.1
Using azure_graph_rbac 0.17.1
Using azure_mgmt_key_vault 0.17.5
Using azure_mgmt_resources 0.17.8
Using azure_mgmt_security 0.18.0
Using azure_mgmt_storage 0.19.3
Using bcrypt_pbkdf 1.0.1
Using builder 3.2.4
Using bundler 2.1.4
Using chef-utils 15.8.23
Using fuzzyurl 0.9.0
Using tomlrb 1.2.9
Using mixlib-config 3.0.6
Using mixlib-shellout 3.0.9
Using chef-config 15.8.23
Using libyajl2 1.2.0
Using ffi-yajl 2.3.3
Using http-form_data 1.0.3
Using http_parser.rb 0.6.0
Using http 2.2.2
Using chef-telemetry 1.0.3
Using coderay 1.1.2
Using declarative 0.0.10
Using declarative-option 0.1.0
Using diff-lcs 1.3
Using excon 0.72.0
Using multi_json 1.14.1
Using docker-api 1.34.2
Using dry-core 0.4.9
Using dry-equalizer 0.3.0
Using dry-configurable 0.11.3
Using dry-container 0.7.2
Using dry-inflector 0.2.0
Using dry-logic 0.6.1
Using dry-types 0.14.1
Using dry-validation 0.13.3
Using regexp_parser 1.7.0
Using ecma-re-validator 0.2.0
Using ed25519 1.2.4
Using equatable 0.6.1
Using erubi 1.9.0
Using faraday_middleware 0.12.2
Using ffi 1.12.2
Using jwt 2.2.1
Using memoist 0.16.2
Using os 1.0.1
Using signet 0.13.0
Using googleauth 0.10.0
Using httpclient 2.8.3
Using mini_mime 1.0.2
Using uber 0.1.0
Using representable 3.0.4
Using retriable 3.1.2
Using google-api-client 0.34.1
Using gssapi 1.3.0
Using gyoku 1.3.1
Using hana 1.3.5
Using hashie 3.6.0
Using htmlentities 4.3.4
Using inifile 3.0.0
Using uri_template 0.7.0
Using json_schemer 0.2.10
Using tty-color 0.5.1
Using pastel 0.7.3
Using strings-ansi 0.2.0
Using unicode-display_width 1.6.1
Using unicode_utils 1.4.0
Using strings 0.1.8
Using tty-cursor 0.7.1
Using tty-box 0.5.0
Using necromancer 0.5.1
Using tty-screen 0.7.1
Using wisper 2.0.1
Using tty-reader 0.7.0
Using tty-prompt 0.20.0
Using license-acceptance 1.0.13
Using method_source 0.9.2
Using mixlib-log 3.0.8
Using parallel 1.19.1
Using parslet 1.8.2
Using pry 0.12.2
Using rspec-support 3.9.2
Using rspec-core 3.9.1
Using rspec-expectations 3.9.0
Using rspec-mocks 3.9.1
Using rspec 3.9.0
Using rspec-its 1.3.0
Using rubyzip 1.3.0
Using semverse 3.0.0
Using sslshake 1.3.0
Using sync 0.5.0
Using tins 1.24.1
Using term-ansicolor 1.7.1
Using thor 0.20.3
Using json 2.3.0
Using net-ssh 5.2.0
Using net-scp 2.0.0
Using train-core 3.2.23
Using tty-table 0.11.0
Using inspec-core 4.18.100
Using little-plugger 1.1.4
Using logging 2.2.2
Using nori 2.6.0
Using rubyntlm 0.6.2
Using winrm 2.3.4
Using winrm-fs 1.3.3
Using train-winrm 0.2.6
Using train 3.2.23
Using train-aws 0.1.15
Using train-habitat 0.2.13
Using inspec 4.18.100
Using mixlib-versioning 1.2.12
Using mixlib-install 3.11.26
Using net-ssh-gateway 2.0.0
Using winrm-elevated 1.2.1
Using test-kitchen 2.3.4
Using tty-which 0.4.2
Using kitchen-terraform 5.2.0
Bundle complete! 1 Gemfile dependency, 185 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
checking if test/assets directory exists
Generating public/private rsa key pair.
Your identification has been saved in test/assets/id_rsa.
Your public key has been saved in test/assets/id_rsa.pub.
The key fingerprint is:
SHA256:0oryWP5ff8kBwQPUSCrLGlVMFzU0rL7TQtJSi6iftyo Kitchen-Terraform AWS provider tutorial
The key's randomart image is:
+---[RSA 4096]----+
|       ooo*X=    |
|       ..o. *o   |
|      o .  . o   |
|     o +  o .    |
|    . +.S= . .   |
|     +.o+ =   .  |
|  . +..  +.o . o |
|   *E  ...+.. +  |
|  . o+=+o. o..   |
+----[SHA256]-----+

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "random" (hashicorp/random) 2.1.2...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.51.0...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.reachable_other_host will be created
  + resource "aws_instance" "reachable_other_host" {
      + ami                          = "ami-1ee65166"
      + arn                          = (known after apply)
      + associate_public_ip_address  = true
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = (known after apply)
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Name"      = "kitchen-terraform-reachable-other-host"
          + "Terraform" = "true"
        }
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_instance.remote_group[0] will be created
  + resource "aws_instance" "remote_group" {
      + ami                          = "ami-1ee65166"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = (known after apply)
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Name"      = "kitchen-terraform-test-target-1"
          + "Terraform" = "true"
        }
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_instance.remote_group[1] will be created
  + resource "aws_instance" "remote_group" {
      + ami                          = "ami-1ee65166"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = (known after apply)
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Name"      = "kitchen-terraform-test-target-1"
          + "Terraform" = "true"
        }
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_internet_gateway.complex_tutorial will be created
  + resource "aws_internet_gateway" "complex_tutorial" {
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "kitchen_terraform_complex_tutorial"
        }
      + vpc_id   = (known after apply)
    }

  # aws_key_pair.complex_tutorial will be created
  + resource "aws_key_pair" "complex_tutorial" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + key_name    = (known after apply)
      + key_pair_id = (known after apply)
      + public_key  = "test/assets/id_rsa"
    }

  # aws_route_table.complex_tutorial will be created
  + resource "aws_route_table" "complex_tutorial" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + tags             = {
          + "Name" = "kitchen_terraform_complex_tutorial"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.complex_tutorial will be created
  + resource "aws_route_table_association" "complex_tutorial" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.complex_tutorial will be created
  + resource "aws_security_group" "complex_tutorial" {
      + arn                    = (known after apply)
      + description            = "Allow all inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
        ]
      + name                   = "kitchen-terraform-complex_tutorial"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name"      = "kitchen-terraform-complex_tutorial"
          + "Terraform" = "true"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.complex_tutorial will be created
  + resource "aws_subnet" "complex_tutorial" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-1a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "192.168.1.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name" = "kitchen_terraform_complex_tutorial"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.complex_tutorial will be created
  + resource "aws_vpc" "complex_tutorial" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "192.168.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Name" = "kitchen_terraform_complex_tutorial"
        }
    }

  # random_string.key_name will be created
  + resource "random_string" "key_name" {
      + id          = (known after apply)
      + length      = 9
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + result      = (known after apply)
      + special     = false
      + upper       = true
    }

Plan: 11 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: myout

To perform exactly these actions, run the following command to apply:
    terraform apply "myout"

terraform-compliance v1.1.11 initiated

🚩 Features	: /terraform-kitchen/test/features
🚩 Plan File	: /terraform-kitchen/myout.json

🚩 Running tests. 🎉

Feature: security_group  # /terraform-kitchen/test/features/security_group.feature
    In order to ensure the security group is secure:

    Scenario: Only selected ports should be publicly open
        Given I have AWS Security Group defined
        When it contains ingress
        Then it must only have tcp protocol and port 22,443 for 0.0.0.0/0

1 features (1 passed)
1 scenarios (1 passed)
3 steps (3 passed)
Run 1583331663 finished within a moment
-----> Starting Test Kitchen (v2.3.4)
-----> Destroying <complex-suite-centos>...
$$$$$$ Verifying the Terraform client version is in the supported interval of >= 0.11.4, < 0.13.0...
$$$$$$ Reading the Terraform client version...
       Terraform v0.12.21
       + provider.aws v2.51.0
       + provider.random v2.1.2
$$$$$$ Finished reading the Terraform client version.
$$$$$$ Finished verifying the Terraform client version.
$$$$$$ Initializing the Terraform working directory...
       Initializing modules...
       
       Initializing the backend...
       
       Initializing provider plugins...
       
       Terraform has been successfully initialized!
$$$$$$ Finished initializing the Terraform working directory.
$$$$$$ Selecting the kitchen-terraform-complex-suite-centos Terraform workspace...
$$$$$$ Finished selecting the kitchen-terraform-complex-suite-centos Terraform workspace.
$$$$$$ Destroying the Terraform-managed infrastructure...
       module.complex_kitchen_terraform.random_string.key_name: Refreshing state... [id=none]
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Refreshing state... [id=kitchen-terraform-mCuZYVLgW]
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Refreshing state... [id=vpc-087d823ca9d14029f]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Refreshing state... [id=igw-00c6ab93eb302816a]
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Refreshing state... [id=subnet-02abf4b4d9ca8d0e8]
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Refreshing state... [id=sg-05cb20be448c5b18c]
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Refreshing state... [id=rtb-06a48303aa1cab2c8]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Refreshing state... [id=i-0e76612dff6fcf0ac]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Refreshing state... [id=i-0bc2d8ab359aa36d6]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Refreshing state... [id=i-029d2ccfbecfb14c0]
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Refreshing state... [id=rtbassoc-092ba6812b48e6251]
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Destroying... [id=rtbassoc-092ba6812b48e6251]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Destroying... [id=i-0bc2d8ab359aa36d6]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Destroying... [id=i-029d2ccfbecfb14c0]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Destroying... [id=i-0e76612dff6fcf0ac]
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Destruction complete after 1s
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Destroying... [id=rtb-06a48303aa1cab2c8]
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Destruction complete after 1s
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Destroying... [id=igw-00c6ab93eb302816a]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0bc2d8ab359aa36d6, 10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 10s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0e76612dff6fcf0ac, 10s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 20s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0e76612dff6fcf0ac, 20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0bc2d8ab359aa36d6, 20s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 31s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0e76612dff6fcf0ac, 31s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0bc2d8ab359aa36d6, 31s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Destruction complete after 32s
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Destruction complete after 33s
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 41s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 40s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 51s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 50s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 1m1s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 1m0s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 1m11s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 1m10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 1m21s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 1m20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 1m31s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 1m30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 1m41s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 1m40s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 1m51s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 1m50s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 2m1s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 2m0s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 2m11s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 2m10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 2m21s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 2m20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 2m31s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 2m30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 2m41s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 2m40s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 2m51s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 2m50s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 3m1s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 3m0s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-029d2ccfbecfb14c0, 3m11s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-00c6ab93eb302816a, 3m10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Destruction complete after 3m16s
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Destroying... [id=kitchen-terraform-mCuZYVLgW]
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Destroying... [id=subnet-02abf4b4d9ca8d0e8]
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Destroying... [id=sg-05cb20be448c5b18c]
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Destruction complete after 1s
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Destruction complete after 1s
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Destruction complete after 1s
       module.complex_kitchen_terraform.random_string.key_name: Destroying... [id=none]
       module.complex_kitchen_terraform.random_string.key_name: Destruction complete after 0s
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Destruction complete after 3m16s
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Destroying... [id=vpc-087d823ca9d14029f]
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Destruction complete after 0s
       
       Destroy complete! Resources: 11 destroyed.
$$$$$$ Finished destroying the Terraform-managed infrastructure.
$$$$$$ Selecting the default Terraform workspace...
       Switched to workspace "default".
$$$$$$ Finished selecting the default Terraform workspace.
$$$$$$ Deleting the kitchen-terraform-complex-suite-centos Terraform workspace...
       Deleted workspace "kitchen-terraform-complex-suite-centos"!
$$$$$$ Finished deleting the kitchen-terraform-complex-suite-centos Terraform workspace.
       Finished destroying <complex-suite-centos> (3m31.75s).
-----> Test Kitchen is finished. (3m32.88s)
-----> Starting Test Kitchen (v2.3.4)
-----> Creating <complex-suite-centos>...
$$$$$$ Verifying the Terraform client version is in the supported interval of >= 0.11.4, < 0.13.0...
$$$$$$ Reading the Terraform client version...
       Terraform v0.12.21
       + provider.aws v2.51.0
       + provider.random v2.1.2
$$$$$$ Finished reading the Terraform client version.
$$$$$$ Finished verifying the Terraform client version.
$$$$$$ Initializing the Terraform working directory...
       Upgrading modules...
       - complex_kitchen_terraform in ../../..
       
       Initializing the backend...
       
       Initializing provider plugins...
       - Checking for available provider plugins...
       - Downloading plugin for provider "random" (hashicorp/random) 2.1.2...
       - Downloading plugin for provider "aws" (hashicorp/aws) 2.51.0...
       
       Terraform has been successfully initialized!
$$$$$$ Finished initializing the Terraform working directory.
$$$$$$ Creating the kitchen-terraform-complex-suite-centos Terraform workspace...
       Created and switched to workspace "kitchen-terraform-complex-suite-centos"!
       
       You're now on a new, empty workspace. Workspaces isolate their state,
       so if you run "terraform plan" Terraform will not see any existing state
       for this configuration.
$$$$$$ Finished creating the kitchen-terraform-complex-suite-centos Terraform workspace.
       Finished creating <complex-suite-centos> (0m16.81s).
-----> Test Kitchen is finished. (0m17.97s)
-----> Starting Test Kitchen (v2.3.4)
-----> Converging <complex-suite-centos>...
$$$$$$ Verifying the Terraform client version is in the supported interval of >= 0.11.4, < 0.13.0...
$$$$$$ Reading the Terraform client version...
       Terraform v0.12.21
       + provider.aws v2.51.0
       + provider.random v2.1.2
$$$$$$ Finished reading the Terraform client version.
$$$$$$ Finished verifying the Terraform client version.
$$$$$$ Selecting the kitchen-terraform-complex-suite-centos Terraform workspace...
$$$$$$ Finished selecting the kitchen-terraform-complex-suite-centos Terraform workspace.
$$$$$$ Downloading the modules needed for the Terraform configuration...
       - complex_kitchen_terraform in ../../..
$$$$$$ Finished downloading the modules needed for the Terraform configuration.
$$$$$$ Validating the Terraform configuration files...
       
       Warning: The -var and -var-file flags are not used in validate. Setting them has no effect.
       
       These flags will be removed in a future version of Terraform.
       
       Success! The configuration is valid, but there were some validation warnings as shown above.
       
$$$$$$ Finished validating the Terraform configuration files.
$$$$$$ Building the infrastructure based on the Terraform configuration...
       module.complex_kitchen_terraform.random_string.key_name: Creating...
       module.complex_kitchen_terraform.random_string.key_name: Creation complete after 0s [id=none]
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Creation complete after 0s [id=kitchen-terraform-YYGPnVK12]
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Creation complete after 4s [id=vpc-00aa64d66abfa8e9c]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Creation complete after 1s [id=igw-040f26850b9edcd1a]
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Creation complete after 3s [id=subnet-000c991d9264c3a5f]
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Creation complete after 2s [id=rtb-0f512a05531ac071c]
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Creation complete after 0s [id=rtbassoc-09d38232188d97f70]
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Creation complete after 3s [id=sg-0bcdd1f63ba2a4b6f]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Creating...
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Creating...
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Creating...
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still creating... [10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still creating... [10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still creating... [10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still creating... [20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still creating... [20s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still creating... [20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still creating... [30s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still creating... [30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still creating... [30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Creation complete after 31s [id=i-0200893e91868aa78]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Creation complete after 34s [id=i-07b21a98c4a535e73]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Creation complete after 38s [id=i-0db748e47640739ea]
       
       Apply complete! Resources: 11 added, 0 changed, 0 destroyed.
       
       Outputs:
       
       ami_id = ami-ae7bfdb8
       reachable_other_host_id = i-0db748e47640739ea
       reachable_other_host_ip_address = 3.84.113.130
       
       remote_group_public_dns = [
         "ec2-54-90-142-41.compute-1.amazonaws.com",
         "ec2-34-229-88-8.compute-1.amazonaws.com",
       ]
       security_group_id = sg-0bcdd1f63ba2a4b6f
       static_terraform_output = static terraform output
       subnet_id = subnet-000c991d9264c3a5f
       terraform_state = /terraform-kitchen/test/fixtures/wrapper/terraform.tfstate.d/kitchen-terraform-complex-suite-centos/terraform.tfstate
       
       test_target_ids = [
         [
           [
             "i-07b21a98c4a535e73",
             "i-0200893e91868aa78",
           ],
         ],
       ]
       test_target_public_dns = [
         [
           [
             "ec2-54-90-142-41.compute-1.amazonaws.com",
             "ec2-34-229-88-8.compute-1.amazonaws.com",
           ],
         ],
       ]
       vpc_id = vpc-00aa64d66abfa8e9c
$$$$$$ Finished building the infrastructure based on the Terraform configuration.
$$$$$$ Reading the output variables from the Terraform state...
       {
         "ami_id": {
           "sensitive": false,
           "type": "string",
           "value": "ami-ae7bfdb8"
         },
         "reachable_other_host_id": {
           "sensitive": false,
           "type": "string",
           "value": "i-0db748e47640739ea"
         },
         "reachable_other_host_ip_address": {
           "sensitive": false,
           "type": "string",
           "value": "3.84.113.130\n"
         },
         "remote_group_public_dns": {
           "sensitive": false,
           "type": [
             "tuple",
             [
        "string",
        "string"
             ]
           ],
           "value": [
             "ec2-54-90-142-41.compute-1.amazonaws.com",
             "ec2-34-229-88-8.compute-1.amazonaws.com"
           ]
         },
         "security_group_id": {
           "sensitive": false,
           "type": "string",
           "value": "sg-0bcdd1f63ba2a4b6f"
         },
         "static_terraform_output": {
           "sensitive": false,
           "type": "string",
           "value": "static terraform output"
         },
         "subnet_id": {
           "sensitive": false,
           "type": "string",
           "value": "subnet-000c991d9264c3a5f"
         },
         "terraform_state": {
           "sensitive": false,
           "type": "string",
           "value": "/terraform-kitchen/test/fixtures/wrapper/terraform.tfstate.d/kitchen-terraform-complex-suite-centos/terraform.tfstate\n"
         },
         "test_target_ids": {
           "sensitive": false,
           "type": [
             "tuple",
             [
        [
          "tuple",
          [
            [
              "tuple",
              [
                "string",
                "string"
              ]
            ]
          ]
        ]
             ]
           ],
           "value": [
             [
        [
          "i-07b21a98c4a535e73",
          "i-0200893e91868aa78"
        ]
             ]
           ]
         },
         "test_target_public_dns": {
           "sensitive": false,
           "type": [
             "tuple",
             [
        [
          "tuple",
          [
            [
              "tuple",
              [
                "string",
                "string"
              ]
            ]
          ]
        ]
             ]
           ],
           "value": [
             [
        [
          "ec2-54-90-142-41.compute-1.amazonaws.com",
          "ec2-34-229-88-8.compute-1.amazonaws.com"
        ]
             ]
           ]
         },
         "vpc_id": {
           "sensitive": false,
           "type": "string",
           "value": "vpc-00aa64d66abfa8e9c"
         }
       }
$$$$$$ Finished reading the output variables from the Terraform state.
$$$$$$ Parsing the Terraform output variables as JSON...
$$$$$$ Finished parsing the Terraform output variables as JSON.
$$$$$$ Writing the output variables to the Kitchen instance state...
$$$$$$ Finished writing the output varibales to the Kitchen instance state.
$$$$$$ Writing the input variables to the Kitchen instance state...
$$$$$$ Finished writing the input variables to the Kitchen instance state.
       Finished converging <complex-suite-centos> (0m55.98s).
-----> Test Kitchen is finished. (0m57.19s)
-----> Starting Test Kitchen (v2.3.4)
-----> Setting up <complex-suite-centos>...
       Finished setting up <complex-suite-centos> (0m0.00s).
-----> Verifying <complex-suite-centos>...
$$$$$$ Reading the Terraform input variables from the Kitchen instance state...
$$$$$$ Finished reading the Terraform input variables from the Kitchen instance state.
$$$$$$ Reading the Terraform output variables from the Kitchen instance state...
$$$$$$ Finished reading the Terraform output varibales from the Kitchen instance state.
-----> Starting verification of the systems.
$$$$$$ Verifying the 'local' system...

Profile: complex kitchen-terraform (complex_suite)
Version: 0.1.0
Target:  local://

  ✔  state_file: 0.12.21
     ✔  0.12.21 is expected to match /\d+\.\d+\.\d+/
  ✔  inspec_attributes: static terraform output
     ✔  static terraform output is expected to eq "static terraform output"
     ✔  static terraform output is expected to eq "static terraform output"


Profile Summary: 2 successful controls, 0 control failures, 0 controls skipped
Test Summary: 3 successful, 0 failures, 0 skipped
$$$$$$ Finished verifying the 'local' system.
$$$$$$ Verifying the 'remote' system...
       [SSH] connection failed, retrying in 1 seconds (#<Net::SSH::ConnectionTimeout: Net::SSH::ConnectionTimeout>)
       [SSH] connection failed, retrying in 1 seconds (#<Errno::ECONNREFUSED: Connection refused - connect(2) for 54.90.142.41:22>)
       [SSH] connection failed, retrying in 1 seconds (#<Net::SSH::AuthenticationFailed: Authentication failed for user centos@ec2-54-90-142-41.compute-1.amazonaws.com>)
       [SSH] connection failed, retrying in 1 seconds (#<Net::SSH::AuthenticationFailed: Authentication failed for user centos@ec2-54-90-142-41.compute-1.amazonaws.com>)

Profile: complex kitchen-terraform (complex_suite)
Version: 0.1.0
Target:  ssh://centos@ec2-54-90-142-41.compute-1.amazonaws.com:22

  ✔  operating_system: centos
     ✔  centos is expected to eq "centos"


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 1 successful, 0 failures, 0 skipped

Profile: complex kitchen-terraform (complex_suite)
Version: 0.1.0
Target:  ssh://centos@ec2-34-229-88-8.compute-1.amazonaws.com:22

  ✔  operating_system: centos
     ✔  centos is expected to eq "centos"


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 1 successful, 0 failures, 0 skipped
$$$$$$ Finished verifying the 'remote' system.
$$$$$$ Verifying the 'remote2' system...
DEPRECATION: AWS resources shipped with core InSpec are being to moved to a resource pack for faster iteration. Please update your profiles to depend on git@github.com:inspec/inspec-aws.git . Resource 'aws_vpc' (used at /terraform-kitchen/test/integration/complex_suite/controls/aws_resources.rb:11)
DEPRECATION: AWS resources shipped with core InSpec are being to moved to a resource pack for faster iteration. Please update your profiles to depend on git@github.com:inspec/inspec-aws.git . Resource 'aws_subnets' (used at /terraform-kitchen/test/integration/complex_suite/controls/aws_resources.rb:16)
DEPRECATION: AWS resources shipped with core InSpec are being to moved to a resource pack for faster iteration. Please update your profiles to depend on git@github.com:inspec/inspec-aws.git . Resource 'aws_security_group' (used at /terraform-kitchen/test/integration/complex_suite/controls/aws_resources.rb:22)

Profile: complex kitchen-terraform (complex_suite)
Version: 0.1.0
Target:  aws://

  ✔  aws_resources: VPC vpc-00aa64d66abfa8e9c
     ✔  VPC vpc-00aa64d66abfa8e9c is expected to exist
     ✔  VPC vpc-00aa64d66abfa8e9c cidr_block is expected to eq "192.168.0.0/16"
     ✔  EC2 VPC Subnets with vpc_id == "vpc-00aa64d66abfa8e9c" states is expected not to include "pending"
     ✔  EC2 VPC Subnets with vpc_id == "vpc-00aa64d66abfa8e9c" cidr_blocks is expected to include "192.168.1.0/24"
     ✔  EC2 VPC Subnets with vpc_id == "vpc-00aa64d66abfa8e9c" subnet_ids is expected to include "subnet-000c991d9264c3a5f"
     ✔  EC2 Security Group sg-0bcdd1f63ba2a4b6f is expected to exist
     ✔  EC2 Security Group sg-0bcdd1f63ba2a4b6f is expected to allow in {:ipv4_range=>"198.144.101.2/32", :port=>22}
     ✔  EC2 Security Group sg-0bcdd1f63ba2a4b6f is expected to allow in {:ipv4_range=>"73.61.21.227/32", :port=>22}
     ✔  EC2 Security Group sg-0bcdd1f63ba2a4b6f is expected to allow in {:ipv4_range=>"198.144.101.2/32", :port=>443}
     ✔  EC2 Security Group sg-0bcdd1f63ba2a4b6f is expected to allow in {:ipv4_range=>"73.61.21.227/32", :port=>443}
     ✔  EC2 Security Group sg-0bcdd1f63ba2a4b6f group_id is expected to cmp == "sg-0bcdd1f63ba2a4b6f"
     ✔  EC2 Security Group sg-0bcdd1f63ba2a4b6f inbound_rules.count is expected to cmp == 3
     ✔  EC2 Instance i-0db748e47640739ea is expected to exist
     ✔  EC2 Instance i-0db748e47640739ea image_id is expected to eq "ami-ae7bfdb8"
     ✔  EC2 Instance i-0db748e47640739ea instance_type is expected to eq "t2.micro"
     ✔  EC2 Instance i-0db748e47640739ea vpc_id is expected to eq "vpc-00aa64d66abfa8e9c"
     ✔  EC2 Instance i-0db748e47640739ea tags is expected to include {:key => "Name", :value => "kitchen-terraform-reachable-other-host"}


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 17 successful, 0 failures, 0 skipped
$$$$$$ Finished verifying the 'remote2' system.
-----> Finished verification of the systems.
       Finished verifying <complex-suite-centos> (0m43.58s).
-----> Test Kitchen is finished. (0m44.76s)
-----> Starting Test Kitchen (v2.3.4)
-----> Destroying <complex-suite-centos>...
$$$$$$ Verifying the Terraform client version is in the supported interval of >= 0.11.4, < 0.13.0...
$$$$$$ Reading the Terraform client version...
       Terraform v0.12.21
       + provider.aws v2.51.0
       + provider.random v2.1.2
$$$$$$ Finished reading the Terraform client version.
$$$$$$ Finished verifying the Terraform client version.
$$$$$$ Initializing the Terraform working directory...
       Initializing modules...
       
       Initializing the backend...
       
       Initializing provider plugins...
       
       Terraform has been successfully initialized!
$$$$$$ Finished initializing the Terraform working directory.
$$$$$$ Selecting the kitchen-terraform-complex-suite-centos Terraform workspace...
$$$$$$ Finished selecting the kitchen-terraform-complex-suite-centos Terraform workspace.
$$$$$$ Destroying the Terraform-managed infrastructure...
       module.complex_kitchen_terraform.random_string.key_name: Refreshing state... [id=none]
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Refreshing state... [id=kitchen-terraform-YYGPnVK12]
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Refreshing state... [id=vpc-00aa64d66abfa8e9c]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Refreshing state... [id=igw-040f26850b9edcd1a]
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Refreshing state... [id=subnet-000c991d9264c3a5f]
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Refreshing state... [id=sg-0bcdd1f63ba2a4b6f]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Refreshing state... [id=i-0db748e47640739ea]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Refreshing state... [id=i-0200893e91868aa78]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Refreshing state... [id=i-07b21a98c4a535e73]
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Refreshing state... [id=rtb-0f512a05531ac071c]
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Refreshing state... [id=rtbassoc-09d38232188d97f70]
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Destroying... [id=rtbassoc-09d38232188d97f70]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Destroying... [id=i-0db748e47640739ea]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Destroying... [id=i-07b21a98c4a535e73]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Destroying... [id=i-0200893e91868aa78]
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Destruction complete after 0s
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Destroying... [id=rtb-0f512a05531ac071c]
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Destruction complete after 1s
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Destroying... [id=igw-040f26850b9edcd1a]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-0200893e91868aa78, 10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-07b21a98c4a535e73, 10s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 10s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-0200893e91868aa78, 20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-07b21a98c4a535e73, 20s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 20s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-07b21a98c4a535e73, 30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-0200893e91868aa78, 30s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Destruction complete after 30s
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 30s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 40s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-07b21a98c4a535e73, 40s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 40s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Destruction complete after 42s
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 50s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 50s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 1m0s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 1m0s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 1m10s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 1m10s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 1m20s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 1m20s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 1m30s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 1m30s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 1m40s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 1m40s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 1m50s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 1m50s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 2m0s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 2m0s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 2m10s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-040f26850b9edcd1a, 2m10s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Destruction complete after 2m18s
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0db748e47640739ea, 2m20s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Destruction complete after 2m29s
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Destroying... [id=kitchen-terraform-YYGPnVK12]
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Destroying... [id=subnet-000c991d9264c3a5f]
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Destroying... [id=sg-0bcdd1f63ba2a4b6f]
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Destruction complete after 0s
       module.complex_kitchen_terraform.random_string.key_name: Destroying... [id=none]
       module.complex_kitchen_terraform.random_string.key_name: Destruction complete after 0s
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Destruction complete after 0s
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Destruction complete after 1s
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Destroying... [id=vpc-00aa64d66abfa8e9c]
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Destruction complete after 1s
       
       Destroy complete! Resources: 11 destroyed.
$$$$$$ Finished destroying the Terraform-managed infrastructure.
$$$$$$ Selecting the default Terraform workspace...
       Switched to workspace "default".
$$$$$$ Finished selecting the default Terraform workspace.
$$$$$$ Deleting the kitchen-terraform-complex-suite-centos Terraform workspace...
       Deleted workspace "kitchen-terraform-complex-suite-centos"!
$$$$$$ Finished deleting the kitchen-terraform-complex-suite-centos Terraform workspace.
       Finished destroying <complex-suite-centos> (2m47.02s).
-----> Test Kitchen is finished. (2m48.17s)
-----> Starting Test Kitchen (v2.3.4)
-----> Destroying <complex-suite-ubuntu>...
$$$$$$ Verifying the Terraform client version is in the supported interval of >= 0.11.4, < 0.13.0...
$$$$$$ Reading the Terraform client version...
       Terraform v0.12.21
       + provider.aws v2.51.0
       + provider.random v2.1.2
$$$$$$ Finished reading the Terraform client version.
$$$$$$ Finished verifying the Terraform client version.
$$$$$$ Initializing the Terraform working directory...
       Initializing modules...
       
       Initializing the backend...
       
       Initializing provider plugins...
       
       Terraform has been successfully initialized!
$$$$$$ Finished initializing the Terraform working directory.
$$$$$$ Selecting the kitchen-terraform-complex-suite-ubuntu Terraform workspace...
       
       Workspace "kitchen-terraform-complex-suite-ubuntu" doesn't exist.
       
       You can create this workspace with the "new" subcommand.
$$$$$$ Creating the kitchen-terraform-complex-suite-ubuntu Terraform workspace...
       Created and switched to workspace "kitchen-terraform-complex-suite-ubuntu"!
       
       You're now on a new, empty workspace. Workspaces isolate their state,
       so if you run "terraform plan" Terraform will not see any existing state
       for this configuration.
$$$$$$ Finished creating the kitchen-terraform-complex-suite-ubuntu Terraform workspace.
$$$$$$ Destroying the Terraform-managed infrastructure...
       
       Destroy complete! Resources: 0 destroyed.
$$$$$$ Finished destroying the Terraform-managed infrastructure.
$$$$$$ Selecting the default Terraform workspace...
       Switched to workspace "default".
$$$$$$ Finished selecting the default Terraform workspace.
$$$$$$ Deleting the kitchen-terraform-complex-suite-ubuntu Terraform workspace...
       Deleted workspace "kitchen-terraform-complex-suite-ubuntu"!
$$$$$$ Finished deleting the kitchen-terraform-complex-suite-ubuntu Terraform workspace.
       Finished destroying <complex-suite-ubuntu> (0m5.54s).
-----> Test Kitchen is finished. (0m6.62s)
-----> Starting Test Kitchen (v2.3.4)
-----> Creating <complex-suite-ubuntu>...
$$$$$$ Verifying the Terraform client version is in the supported interval of >= 0.11.4, < 0.13.0...
$$$$$$ Reading the Terraform client version...
       Terraform v0.12.21
       + provider.aws v2.51.0
       + provider.random v2.1.2
$$$$$$ Finished reading the Terraform client version.
$$$$$$ Finished verifying the Terraform client version.
$$$$$$ Initializing the Terraform working directory...
       Upgrading modules...
       - complex_kitchen_terraform in ../../..
       
       Initializing the backend...
       
       Initializing provider plugins...
       - Checking for available provider plugins...
       - Downloading plugin for provider "random" (hashicorp/random) 2.1.2...
       - Downloading plugin for provider "aws" (hashicorp/aws) 2.51.0...
       
       Terraform has been successfully initialized!
$$$$$$ Finished initializing the Terraform working directory.
$$$$$$ Creating the kitchen-terraform-complex-suite-ubuntu Terraform workspace...
       Created and switched to workspace "kitchen-terraform-complex-suite-ubuntu"!
       
       You're now on a new, empty workspace. Workspaces isolate their state,
       so if you run "terraform plan" Terraform will not see any existing state
       for this configuration.
$$$$$$ Finished creating the kitchen-terraform-complex-suite-ubuntu Terraform workspace.
       Finished creating <complex-suite-ubuntu> (0m6.84s).
-----> Test Kitchen is finished. (0m7.72s)
-----> Starting Test Kitchen (v2.3.4)
-----> Converging <complex-suite-ubuntu>...
$$$$$$ Verifying the Terraform client version is in the supported interval of >= 0.11.4, < 0.13.0...
$$$$$$ Reading the Terraform client version...
       Terraform v0.12.21
       + provider.aws v2.51.0
       + provider.random v2.1.2
$$$$$$ Finished reading the Terraform client version.
$$$$$$ Finished verifying the Terraform client version.
$$$$$$ Selecting the kitchen-terraform-complex-suite-ubuntu Terraform workspace...
$$$$$$ Finished selecting the kitchen-terraform-complex-suite-ubuntu Terraform workspace.
$$$$$$ Downloading the modules needed for the Terraform configuration...
       - complex_kitchen_terraform in ../../..
$$$$$$ Finished downloading the modules needed for the Terraform configuration.
$$$$$$ Validating the Terraform configuration files...
       
       Warning: The -var and -var-file flags are not used in validate. Setting them has no effect.
       
       These flags will be removed in a future version of Terraform.
       
       Success! The configuration is valid, but there were some validation warnings as shown above.
       
$$$$$$ Finished validating the Terraform configuration files.
$$$$$$ Building the infrastructure based on the Terraform configuration...
       module.complex_kitchen_terraform.random_string.key_name: Creating...
       module.complex_kitchen_terraform.random_string.key_name: Creation complete after 0s [id=none]
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Creation complete after 1s [id=kitchen-terraform-UmLcrDMvL]
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Creation complete after 5s [id=vpc-0c7ec7d094799cf26]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Creation complete after 2s [id=subnet-05114dab92081c257]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Creation complete after 3s [id=igw-0371d2a03bae203a0]
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Creation complete after 4s [id=sg-001002c5c6278f08e]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Creating...
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Creating...
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Creating...
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Creation complete after 2s [id=rtb-0d56ac27995cc4de5]
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Creating...
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Creation complete after 1s [id=rtbassoc-0c77ba2527a5c703f]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still creating... [10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still creating... [10s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still creating... [10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still creating... [20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still creating... [20s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still creating... [20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Creation complete after 26s [id=i-0e96673ace493908c]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still creating... [30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still creating... [30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Creation complete after 39s [id=i-0d012be2adc3df792]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still creating... [40s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Creation complete after 50s [id=i-0e857a5f418a833c1]
       
       Apply complete! Resources: 11 added, 0 changed, 0 destroyed.
       
       Outputs:
       
       ami_id = ami-1ee65166
       reachable_other_host_id = i-0e857a5f418a833c1
       reachable_other_host_ip_address = 54.213.9.36
       
       remote_group_public_dns = [
         "ec2-35-164-210-107.us-west-2.compute.amazonaws.com",
         "ec2-34-222-126-87.us-west-2.compute.amazonaws.com",
       ]
       security_group_id = sg-001002c5c6278f08e
       static_terraform_output = static terraform output
       subnet_id = subnet-05114dab92081c257
       terraform_state = /terraform-kitchen/test/fixtures/wrapper/terraform.tfstate.d/kitchen-terraform-complex-suite-ubuntu/terraform.tfstate
       
       test_target_ids = [
         [
           [
             "i-0e96673ace493908c",
             "i-0d012be2adc3df792",
           ],
         ],
       ]
       test_target_public_dns = [
         [
           [
             "ec2-35-164-210-107.us-west-2.compute.amazonaws.com",
             "ec2-34-222-126-87.us-west-2.compute.amazonaws.com",
           ],
         ],
       ]
       vpc_id = vpc-0c7ec7d094799cf26
$$$$$$ Finished building the infrastructure based on the Terraform configuration.
$$$$$$ Reading the output variables from the Terraform state...
       {
         "ami_id": {
           "sensitive": false,
           "type": "string",
           "value": "ami-1ee65166"
         },
         "reachable_other_host_id": {
           "sensitive": false,
           "type": "string",
           "value": "i-0e857a5f418a833c1"
         },
         "reachable_other_host_ip_address": {
           "sensitive": false,
           "type": "string",
           "value": "54.213.9.36\n"
         },
         "remote_group_public_dns": {
           "sensitive": false,
           "type": [
             "tuple",
             [
        "string",
        "string"
             ]
           ],
           "value": [
             "ec2-35-164-210-107.us-west-2.compute.amazonaws.com",
             "ec2-34-222-126-87.us-west-2.compute.amazonaws.com"
           ]
         },
         "security_group_id": {
           "sensitive": false,
           "type": "string",
           "value": "sg-001002c5c6278f08e"
         },
         "static_terraform_output": {
           "sensitive": false,
           "type": "string",
           "value": "static terraform output"
         },
         "subnet_id": {
           "sensitive": false,
           "type": "string",
           "value": "subnet-05114dab92081c257"
         },
         "terraform_state": {
           "sensitive": false,
           "type": "string",
           "value": "/terraform-kitchen/test/fixtures/wrapper/terraform.tfstate.d/kitchen-terraform-complex-suite-ubuntu/terraform.tfstate\n"
         },
         "test_target_ids": {
           "sensitive": false,
           "type": [
             "tuple",
             [
        [
          "tuple",
          [
            [
              "tuple",
              [
                "string",
                "string"
              ]
            ]
          ]
        ]
             ]
           ],
           "value": [
             [
        [
          "i-0e96673ace493908c",
          "i-0d012be2adc3df792"
        ]
             ]
           ]
         },
         "test_target_public_dns": {
           "sensitive": false,
           "type": [
             "tuple",
             [
        [
          "tuple",
          [
            [
              "tuple",
              [
                "string",
                "string"
              ]
            ]
          ]
        ]
             ]
           ],
           "value": [
             [
        [
          "ec2-35-164-210-107.us-west-2.compute.amazonaws.com",
          "ec2-34-222-126-87.us-west-2.compute.amazonaws.com"
        ]
             ]
           ]
         },
         "vpc_id": {
           "sensitive": false,
           "type": "string",
           "value": "vpc-0c7ec7d094799cf26"
         }
       }
$$$$$$ Finished reading the output variables from the Terraform state.
$$$$$$ Parsing the Terraform output variables as JSON...
$$$$$$ Finished parsing the Terraform output variables as JSON.
$$$$$$ Writing the output variables to the Kitchen instance state...
$$$$$$ Finished writing the output varibales to the Kitchen instance state.
$$$$$$ Writing the input variables to the Kitchen instance state...
$$$$$$ Finished writing the input variables to the Kitchen instance state.
       Finished converging <complex-suite-ubuntu> (1m8.30s).
-----> Test Kitchen is finished. (1m9.18s)
-----> Starting Test Kitchen (v2.3.4)
-----> Setting up <complex-suite-ubuntu>...
       Finished setting up <complex-suite-ubuntu> (0m0.00s).
-----> Verifying <complex-suite-ubuntu>...
$$$$$$ Reading the Terraform input variables from the Kitchen instance state...
$$$$$$ Finished reading the Terraform input variables from the Kitchen instance state.
$$$$$$ Reading the Terraform output variables from the Kitchen instance state...
$$$$$$ Finished reading the Terraform output varibales from the Kitchen instance state.
-----> Starting verification of the systems.
$$$$$$ Verifying the 'local' system...

Profile: complex kitchen-terraform (complex_suite)
Version: 0.1.0
Target:  local://

  ✔  state_file: 0.12.21
     ✔  0.12.21 is expected to match /\d+\.\d+\.\d+/
  ✔  inspec_attributes: static terraform output
     ✔  static terraform output is expected to eq "static terraform output"
     ✔  static terraform output is expected to eq "static terraform output"


Profile Summary: 2 successful controls, 0 control failures, 0 controls skipped
Test Summary: 3 successful, 0 failures, 0 skipped
$$$$$$ Finished verifying the 'local' system.
$$$$$$ Verifying the 'remote' system...

Profile: complex kitchen-terraform (complex_suite)
Version: 0.1.0
Target:  ssh://ubuntu@ec2-35-164-210-107.us-west-2.compute.amazonaws.com:22

  ✔  operating_system: ubuntu
     ✔  ubuntu is expected to eq "ubuntu"


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 1 successful, 0 failures, 0 skipped

Profile: complex kitchen-terraform (complex_suite)
Version: 0.1.0
Target:  ssh://ubuntu@ec2-34-222-126-87.us-west-2.compute.amazonaws.com:22

  ✔  operating_system: ubuntu
     ✔  ubuntu is expected to eq "ubuntu"


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 1 successful, 0 failures, 0 skipped
$$$$$$ Finished verifying the 'remote' system.
-----> Finished verification of the systems.
       Finished verifying <complex-suite-ubuntu> (0m6.98s).
-----> Test Kitchen is finished. (0m8.21s)
-----> Starting Test Kitchen (v2.3.4)
-----> Destroying <complex-suite-ubuntu>...
$$$$$$ Verifying the Terraform client version is in the supported interval of >= 0.11.4, < 0.13.0...
$$$$$$ Reading the Terraform client version...
       Terraform v0.12.21
       + provider.aws v2.51.0
       + provider.random v2.1.2
$$$$$$ Finished reading the Terraform client version.
$$$$$$ Finished verifying the Terraform client version.
$$$$$$ Initializing the Terraform working directory...
       Initializing modules...
       
       Initializing the backend...
       
       Initializing provider plugins...
       
       Terraform has been successfully initialized!
$$$$$$ Finished initializing the Terraform working directory.
$$$$$$ Selecting the kitchen-terraform-complex-suite-ubuntu Terraform workspace...
$$$$$$ Finished selecting the kitchen-terraform-complex-suite-ubuntu Terraform workspace.
$$$$$$ Destroying the Terraform-managed infrastructure...
       module.complex_kitchen_terraform.random_string.key_name: Refreshing state... [id=none]
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Refreshing state... [id=kitchen-terraform-UmLcrDMvL]
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Refreshing state... [id=vpc-0c7ec7d094799cf26]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Refreshing state... [id=igw-0371d2a03bae203a0]
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Refreshing state... [id=subnet-05114dab92081c257]
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Refreshing state... [id=sg-001002c5c6278f08e]
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Refreshing state... [id=rtb-0d56ac27995cc4de5]
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Refreshing state... [id=rtbassoc-0c77ba2527a5c703f]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Refreshing state... [id=i-0e857a5f418a833c1]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Refreshing state... [id=i-0d012be2adc3df792]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Refreshing state... [id=i-0e96673ace493908c]
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Destroying... [id=rtbassoc-0c77ba2527a5c703f]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Destroying... [id=i-0e857a5f418a833c1]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Destroying... [id=i-0d012be2adc3df792]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Destroying... [id=i-0e96673ace493908c]
       module.complex_kitchen_terraform.aws_route_table_association.complex_tutorial: Destruction complete after 0s
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Destroying... [id=rtb-0d56ac27995cc4de5]
       module.complex_kitchen_terraform.aws_route_table.complex_tutorial: Destruction complete after 2s
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Destroying... [id=igw-0371d2a03bae203a0]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-0d012be2adc3df792, 10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 10s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0e857a5f418a833c1, 10s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-0d012be2adc3df792, 20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 20s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0e857a5f418a833c1, 20s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Still destroying... [id=i-0d012be2adc3df792, 30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 30s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Still destroying... [id=i-0e857a5f418a833c1, 30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[1]: Destruction complete after 31s
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 30s elapsed]
       module.complex_kitchen_terraform.aws_instance.reachable_other_host: Destruction complete after 32s
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 40s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 40s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 50s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 50s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 1m0s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 1m0s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 1m10s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 1m10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 1m20s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 1m20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 1m30s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 1m30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 1m40s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 1m40s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 1m50s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 1m50s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 2m0s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 2m0s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 2m10s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 2m10s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 2m20s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 2m20s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 2m30s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 2m30s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 2m40s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 2m40s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 2m50s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Still destroying... [id=igw-0371d2a03bae203a0, 2m50s elapsed]
       module.complex_kitchen_terraform.aws_internet_gateway.complex_tutorial: Destruction complete after 2m52s
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Still destroying... [id=i-0e96673ace493908c, 3m0s elapsed]
       module.complex_kitchen_terraform.aws_instance.remote_group[0]: Destruction complete after 3m2s
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Destroying... [id=kitchen-terraform-UmLcrDMvL]
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Destroying... [id=subnet-05114dab92081c257]
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Destroying... [id=sg-001002c5c6278f08e]
       module.complex_kitchen_terraform.aws_key_pair.complex_tutorial: Destruction complete after 0s
       module.complex_kitchen_terraform.random_string.key_name: Destroying... [id=none]
       module.complex_kitchen_terraform.random_string.key_name: Destruction complete after 0s
       module.complex_kitchen_terraform.aws_subnet.complex_tutorial: Destruction complete after 1s
       module.complex_kitchen_terraform.aws_security_group.complex_tutorial: Destruction complete after 1s
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Destroying... [id=vpc-0c7ec7d094799cf26]
       module.complex_kitchen_terraform.aws_vpc.complex_tutorial: Destruction complete after 1s
       
       Destroy complete! Resources: 11 destroyed.
$$$$$$ Finished destroying the Terraform-managed infrastructure.
$$$$$$ Selecting the default Terraform workspace...
       Switched to workspace "default".
$$$$$$ Finished selecting the default Terraform workspace.
$$$$$$ Deleting the kitchen-terraform-complex-suite-ubuntu Terraform workspace...
       Deleted workspace "kitchen-terraform-complex-suite-ubuntu"!
$$$$$$ Finished deleting the kitchen-terraform-complex-suite-ubuntu Terraform workspace.
       Finished destroying <complex-suite-ubuntu> (3m23.99s).
-----> Test Kitchen is finished. (3m24.86s)
```


