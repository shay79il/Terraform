# Using Terraform CLI when apply
####################################

# Precedence
#############

#######
# (1) #
#######
# CLI '-var' or '-var-file' (command-line flags)
# E.g.
# $ terraform apply -var "filename=/root/pets1.txt"  \
#                   -var "content=We love pets1!"    \
#                   -var "prefix=Mrs1"               \
#                   -var "seperator=."              \
#                   -var "length=1"


#######
# (2) #
#######
# Use of *.auto.tfvars file
#############################
# E.g.
# In the file 
# variable.auto.tfvars
# filename="/root/pets2.txt"
# content="We love pets2!"
# prefix="Mrs2"
# separator="."
# length="2"

#######
# (3) #
#######
# Use of terraform.tfvars file
#############################
# E.g.
# In the file 
# terraform.tfvars
filename="/root/pets3.txt"
content="We love pets3!"
prefix="Mrs3"
separator="."
length="3"


# Use of ENV varibles
#############################
# $ export TF_VAR_filename="/root/pets4.txt"
# $ export TF_VAR_content="We love pets4!"
# $ export TF_VAR_prefix="Mrs4"
# $ export TF_VAR_separator="."
# $ export TF_VAR_length="4"


# $ terraform apply

