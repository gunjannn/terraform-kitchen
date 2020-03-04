#! /usr/bin/env bash


# Install gems
if [ ! -e Gemfile.lock ]; then
    gem install bundler
    bundle install
fi


# Setup the keypairs if they don't already exist
# Make a directory to contain the key
echo "checking if test/assets directory exists"
if [ ! -d test/assets ]; then

    mkdir -p test/assets
else
    echo "Directory already exists"
fi


if [ ! -e test/assets/id_rsa ]; then
    # Generate a 4096 bit RSA key with a blank passphrase in the directory
    ssh-keygen \
        -b 4096 \
        -C "Kitchen-Terraform AWS provider tutorial" \
        -f test/assets/id_rsa \
        -N "" \
        -t rsa
else
    echo "key pair exists"
fi

# Testing terraform-compliance
if [ ! -d .terraform ]; then
    terraform init
fi

terraform plan -out=myout -var-file=testing.tfvars
terraform show -json myout > myout.json
terraform-compliance -p ./myout.json -f ./test/features
[ -e myout ] && rm myout
[ -e myout.json ] && rm myout.json




# Unset AWS STS session environment variables
function drop_aws_sts_session {
  unset AWS_ACCESS_KEY_ID
  unset AWS_DEFAULT_REGION
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN
}

# Export AWS STS session environment variables
function export_aws_sts_session {
  drop_aws_sts_session
  session="$(aws sts get-session-token --output=json)"
  AWS_ACCESS_KEY_ID="$(echo $session | jq -r .Credentials.AccessKeyId)"
  AWS_DEFAULT_REGION="$1"
  AWS_SECRET_ACCESS_KEY="$(echo $session | jq -r .Credentials.SecretAccessKey)"
  AWS_SESSION_TOKEN="$(echo $session | jq -r .Credentials.SessionToken)"
  export AWS_ACCESS_KEY_ID
  export AWS_DEFAULT_REGION
  export AWS_SECRET_ACCESS_KEY
  export AWS_SESSION_TOKEN
}



export_aws_sts_session "us-east-1"

# Destroy any existing Terraform state in us-east-1
bundle exec kitchen destroy centos

# Initialize the Terraform working directory and select a new Terraform workspace
# to test CentOS in us-east-1
bundle exec kitchen create centos

# Apply the Terraform root module to the Terraform state using the Terraform
# fixture configuration
bundle exec kitchen converge centos

# Test the Terraform state using the InSpec controls
bundle exec kitchen verify centos

# Destroy the Terraform state using the Terraform fixture configuration
bundle exec kitchen destroy centos

export_aws_sts_session "us-west-2"

# Destroy any existing Terraform state in us-east-1
bundle exec kitchen destroy ubuntu

# Initialize the Terraform working directory and select a new Terraform workspace
# to test CentOS in us-east-1
bundle exec kitchen create ubuntu

# Apply the Terraform root module to the Terraform state using the Terraform
# fixture configuration
bundle exec kitchen converge ubuntu

# Test the Terraform state using the InSpec controls
bundle exec kitchen verify ubuntu

# Destroy the Terraform state using the Terraform fixture configuration
bundle exec kitchen destroy ubuntu

#export_aws_sts_session "us-west-2"

# Perform the same steps for Ubuntu in us-west-2
#bundle exec kitchen test ubuntu

drop_aws_sts_session
