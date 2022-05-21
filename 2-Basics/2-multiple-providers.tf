
# Multiple Providers
# We can use Multiple Providers in the same configuration file
# E.g.
# local, random

# provide - local
# resurce type - file
resource "local_file" "pet" {
  filename  = "/home/shay79il/Documents/Private/Studies/devopsExperts/CertificationStudy/Terraform/2-Basics/pets.txt"
  content   = "We love pets!"
}

# provide - random
# resurce type - pet
# length - length in words of the random_pet name
resource "random_pet" "my-pet" {
  prefix    = "Mrs"
  separator = "."
  length    = "1"
}

