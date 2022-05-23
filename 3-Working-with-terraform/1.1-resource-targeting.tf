
# Lets assume we have 2 dependent resources
# "aws_instance" on "random_string" and we want to change 
# ONLY the "random_string" length WITHOUT recreating the 
# "aws_instance" resource 
# So...
# We can do just by changing the relevent resource
# "random_string" length to 5 
# AND
# Run the following command
# terraform apply –target random_string.server-suffix


resource "random_string" "server-suffix" {
  length  = 6
  upper   = false
  special = false
}
resource "aws_instance" "web" {
  ami           = "ami-06178cf087598769c"
  instance_type = "m5.large"
  tags          = {
    Name = "web-${random_string.server-suffix.id}"
  }
}
