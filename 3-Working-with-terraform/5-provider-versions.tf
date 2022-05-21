# 1) Go to https://registry.terraform.io/
# 2) Serch for the relevent provider
# 3) choose the version you want to work with 
# 4) Push the 'USE PROVIDER' button to Copy & Paste
#    the code to use the relevent version you neen
#    into the main.tf file which uses the provider

# https://www.terraform.io/docs/configuration/version-constraints.html#version-constraint-syntax

terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "1.4.0"
      # Or
      # version = "> 1.2.0, < 2.0.0, != 1.4.0"
      # Or
      # version = "~>1.2"
    }
  }
}
resource "local_file" "pet" {
  filename = "/root/pet.txt"
  content  = "We love pets!"
}
