

resource "aws_instance" "webserver" {
  ami           = "ami-0edab43b6fa892279"
  instance_type = "t2.micro"
  tags = {
    Name        = "webserver"
    Description = "An Nginx WebServer on Ubuntu"
  }

  key_name = aws_key_pair.web.id

  vpc_security_group_ids = [aws_security_group.ssh-access.id]
  ######################################################
  ######################################################

  ##############
  # provisioners
  ##############
  # provisioners, by default they run AFTER the provisionning took place
  #               BUT it can be overwriten by the 'when' meta-argument
  # remote-exec - on the provisioned instance
  # local-exec - on the local host which run the terraform configuration

  # In order to run on the REMOTE provisioned EC2
  # a scripte after its provisioned
  #################################################

  # Option 1
  # #########
  # In order this option will take place we should 
  # have a 'security group' AND 'SSH key pair' in place
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "systemctl enable nginx",
      "systemctl start nginx"
    ]
  }
  connection {
    type        = "ssh"
    host        = self.publioc_ip
    user        = "ubuntu"
    private_key = file("/root/.ssh/web")
  }

  # Option 2
  # #########
  # user_data = <<-EOF
  #             #!/bin/bash
  #             sudo apt update
  #             sudo apt install nginx -y
  #             systemctl enable nginx
  #             systemctl start nginx
  #             EOF
  ######################################################
  ######################################################

  #############
  # local-exec 
  #############
  # Running LOCAL script (where the Terraform is running)
  # In order to save (e.g.) the public IP of the provisioned 
  # instance into a local file for later use
  provisioner "local-exec" {
    when = destroy # optional to be excecuted JUST before 
    # the resource is about to be destroied

    on_failure = continue # optional to continue the provisionning / desturction  
    # even if terraform encountered a failure on the following 
    # command (lets say we woter '/temp/ips.txt' insted of '/tmp/ips.txt')
    # Notic!
    # the default behaviour is 'fail' insted of 'continue'

    command = "echo ${aws_instance.webserver2.public_ip} >> /tmp/ips.txt"
  }

  ######################################################
  ######################################################
}

# For the 'vpc_security_group_ids' in the 'aws_instance'
#######################################################
resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Allow SSH access from the Internet"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# For the 'key_name' in the 'aws_instance'
##########################################
# Use of a public key for the EC2 instance
# Option 1
resource "aws_key_pair" "web" {
  public_key = file("/root/.ssh/web.pub")
}

# Option 2
# resource "aws_key_pair" "web" {
# public_key = "ssh-rsa 
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@
# root@iac-server"
# }



output "publicip" {
  value = aws_instance.webserver.public_ip
}