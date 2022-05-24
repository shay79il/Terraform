
# We have a VPC and want to add a security group
# with some ingress ports


###############################
# Option 1 - NO dynamic blocks
###############################
resource "aws_vpc" "backend-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "backend-vpc"
  }
}
resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.backend-vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "private-subnet"
  }
}
resource "aws_security_group" "backend-sg" {
  name = "backend-sg"
  vpc_id = aws_vpc.backend-vpc.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # And lets say we want to add more ports
  # ...
  # ...
  # ...
}


#############################
# Option 2 -  dynamic blocks
#############################


# variables.tf
variable "ingress_ports" {
  type = list
  default = [22, 8080]
}


resource "aws_security_group" "backend-sg" {
  name = "backend-sg"
  vpc_id = aws_vpc.backend-vpc.id
  
  dynamic "ingress" {
    
    for_each = var.ingress_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

# The [*] called splat which output all 
# the list elements of the ingress rules
# of the aws security group above
output "to_ports" {
  value = aws_security_group.backend-sg.ingress[*].to_port
}

