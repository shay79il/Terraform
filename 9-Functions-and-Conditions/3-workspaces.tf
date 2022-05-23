
# terraform workspace commands
#     - select
#     - new
#     - list
#     - show
#     - delete


# Start a NEW workspace run in the console:
###########################################
# terraform workspace new Project


# List all workspace:
######################
# terraform workspace list

# Select specific workspace:
############################
# terraform workspace select <workspaceName>


# Lets say we have 2 wokspaces 
# development
# production

# Content of 'variables.tf'
############################
variable region {
  default = "ca-central-1"
}
variable instance_type {
  default = "t2.micro"
}
variable ami {
  type = map
  default = {
    "development" = "ami-0edab43b6fa892279",
    "production"  = "ami-0c2f25c1f66a1ff4d"
  }
}

# Content of 'main.tf'
############################
resource "aws_instance" "project" {
  ami = lookup(var.ami, terraform.workspace)
  instance_type = var.instance_type
  tags = {
    Name = terraform.workspace
  }
}












