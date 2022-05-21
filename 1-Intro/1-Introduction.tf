# <block> <parameters> {
#   key1 = value1
#   key2 = value2
# }

# Resource Block
#################
# <ResourceType> - <provider_resource>
# e.g. 
# provider = local
# For moe providers lgo to 
# https://registry.terraform.io/browse/providers
# resource = file
# <blockName> <ResourceType> <ResourceName> {
#   key1 = value1
#   key2 = value2
# }


# Example
# filename - MUST be FULL path
resource "local_file" "pet" {
  filename = "/home/shay79il/Documents/Private/Studies/devopsExperts/CertificationStudy/Terraform/2-Basics/pets.txt"
  content = "We love pets!"
  file_permission = "0777"
}

# Run the following comands 
#############################

# init for installing all relevent providers
# terraform init

# Watch the planned provisioning 
# terraform plan

# Apply the provisioning 
# terraform apply

# Apply the provisioning 
# terraform show


# How to update
################
# 1) Change whatever we want in the resource 
# 2) terraform plan

# How to delete
################
# 1) terraform destroy




