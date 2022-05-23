
# In order to import a resource which is NOT
# managed by Terraform we can import it by the 'import' command
# e.g.
# terraform import <resource-address> <resource-atteribute>
# terraform import aws_instance.webserver-2 i-026e13be10d5326f7

#! Before importing resource, please create its configuration 
#! in the root module. For example:
resource "aws_instance" "webserver-2" {
  # (resource arguments)
}

# - run 'terraform show' 
# OR 
# - run 'terraform state show <resource-address>' 
# OR 
# - look at the 'terraform.tfstate' file
# to inspect all its attributes to be copied 
# into the EMPTY resource block we just previously configured