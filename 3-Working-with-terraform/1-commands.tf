
# terraform validate
####################
# validate the content of a confuguration file

# terraform fmt
####################
# makes all relevant indentation and stuff

# terraform show -json
####################
# show the current state of all resources 
# including all attributes created by terraform for each resource
# Use the '-json' flag to get json format on the satat

# terraform providers [mirror </path/to/file]
##############################################
# show all providers which are included in the configuration files
# use the mirror sub-command to get all the used plugins


# terraform output [output_variable_name]
##########################################
# Print all output variabels
# use the [output_variable_name] option 
# to see a specific output variable

# terraform refresh
#####################
# refresh the state of all resources

# terraform plan [--refresh=false]
#####################################
# Print to screen all the changes which will be 
# applied when we run the the apply command
# - Use the flag '--refresh=false' option for better performance
# - When terraform.tfstat collaburated it should be 
#   stored on S3 on AWS for example because of sensitive data
#   which can be encrypted on S3 and one source of truth


# terraform apply [-auto-approve] [-replace="<resource_name>"]
##################################
# Apply all changes / additions / destructions
# - The [-auto-approve] option is for us to skip 
#   the option to approve the apply command.
# - The [-replace="<resource_name>"] option is for 
#   replacing a particular object even though 
#   there are no configuration changes.


# terraform get [version]
###############
# Get the relevant module which we want use and
# which was specified in the 'module' block 
# of our configuration
# In order to get a spesific version 
# look at
# https://github.com/terraform-aws-modules/terraform-aws-security-group/tree/master/modules/ssh
# on the the 'Tags' history



# terraform graph
#################
# Show the dependencies of all resources
# used my www.webgraphviz.com/?tab=map
# for visual representaion
# Or 
# we could download the app
# 1) apt update
# 2) apt install graphviz y
# 3) terraform graph | dot Tsvg > graph.svg

