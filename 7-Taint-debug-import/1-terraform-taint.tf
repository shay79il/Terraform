

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