# Install aws CLI
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install

# Run over the CLI
###################
# aws configure

##############################################################################
##############################################################################

# Get the credentials
######################
# cat .aws/config
# cat .aws/credentials

# how to .aws/credentials
##################
# [default]
# aws_access_key_id =
# aws_secret_access_key =

# how to .aws/config
##################
# [default]
# region=us-west-1
# output=json

# OR
#######
# $ export AWS_ACCESS_KEY_ID= ...
# $ export AWS_SECRET_ACCESS_KEY_ID= ...
# $ export AWS_REGION=us-west-2

# OR
# Use of provider block
# provider "aws" {
#   region = "us-east-1"
#   access_key = ...
#   secret_key = ...
# }


##############################################################################
##############################################################################

# Generic use of AWS CLI
##########################
# aws <command> <subcommand> [options and parameters]

# Get help on a specific command
#################################
# aws <command> help
# e.g.
# aws iam help

# Get help on a specific sub-command
#################################
# aws <command> <subcommand> help
# e.g.
# aws iam create-user help
