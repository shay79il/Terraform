# Configure this terraform block configuration
# creates a backend resource to store the STATE file
# "terraform.tfstate" into S3 bucket we created
# and we can delete the "terraform.tfstate" from local repo
# this should be done by running the 'terraform init' FIRST


# terraform {
#   backend "s3" {
#     bucket         = "kodekloud-terraform-state-bucket01"
#     key            = "finance/terraform.tfstate"
#     region         = "us-west-1"
#     dynamodb_table = "state-locking"
#   }
# }


# Terraform State Commands
# terraform state <subcommand> [options] [args]
# subcommand:
#   - list
#   - show
#   - mv
#   - pull
#   - rm


# terraform state show command
###############################
# terraform state show aws_s3_bucket.finance-2020922
resource "aws_s3_bucket" "terraform-state" {
  acl                         = "private"
  arn                         = "arn:aws:s3::: finance-2020922 "
  bucket                      = "finance-2020922 "
  bucket_domain_name          = "finance-2020922.s3.amazonaws.com"
  bucket_regional_domain_name = " finance-2020922.s3.us-west-1.amazonaws.com"
  force_destroy               = false
  hosted_zone_id              = "Z2F5ABCDE1ACD"
  id                          = "finance-2020922 "
  region                      = "us-west-1"
  request_payer               = "BucketOwner"
  tags = {
    "Descritpion" = "Bucket to store Finance and Payroll Information"
  }
  versioning {
    enabled    = false
    mfa_delete = false
  }
}



# terraform state mv command
############################
# terraform state mv [options] SOURCE  DESTINATION
# e.g.
# change the NAME of the resource on AWS without destroying and recreate the resource
# terraform state mv   aws_dynamodb_table.state-locking     aws_dynamodb_table.state-locking-db
# NOTICE!!
# rename the NAME on the resource MANUALLY(!!) on the configuration file

# Before
resource "aws_dynamodb_table" "state-locking" {
  name         = "state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

# After
resource "aws_dynamodb_table" "state-locking" {
  name         = "state-locking-db"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}


# terraform state pull 
###############################
# get the terraform REMOTE state file in order to query 
# e.g.
# terraform state pull | jq '.resources[] | select(.name  == "state-locking-db")|.instances[].attributes.hash_key'


# terraform state rm ADDRESS
###############################
# remove items for the state file so that 
# terraform will NO longer manage the specific resource
# Be aware!!
# The resource will still be up and running on the realworld 
# unless deleted manually 
# The 'rm' command is ONLY for terraform wont manage the resource any more
