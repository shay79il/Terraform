


# Using taint command is for situations when a manual change has occure 
# lets say a version of nginx over the VM running it we could run 'terraform destroy' 
# and 'terraform apply' command after
# BUT
# Instead we could 'taint' the resource by using the 'terraform taint'  command 
# and run 'terraform apply' command after this way ONLY the relevant resource will be 
# recreated 

# On the contrary
# When we run an 'apply' command and it failed ONLY due to 
# something we dont have problem with (for example the 
# following resource block which just 'cat' the ip to a local file)
# but the "aws_instance" provisioned successfully we can run 
# the 'terraform untaint' command to the relevent tainted resource


resource "aws_instance" "webserver-3" {
  ami           = "ami-0edab43b6fa892279"
  instance_type = "t2.micro"
  key_name      = "ws"
  provisioner "local-exec" {
    #! When we have an error  (e.g. 'temp' dir not exists in this example)
    #! The whole resource (even if successfully provisioned) will be tainted
    #! after 'terraform apply' command
    #! In order to see the tainted resource run the 'terraform plan' command
    command = "echo ${aws_instance.webserver-3.public_ip} > /temp/pub_ip.txt"
  }
}

#?Explicitly TAINT a resource run the following
# terraform taint <resource_address> 
# e.g. 
# terraform taint aws_instance.webserver

#? Explicitly UNTAINT a resource run the following
# terraform untaint <resource_address> 
# e.g. 
# terraform untaint aws_instance.webserver