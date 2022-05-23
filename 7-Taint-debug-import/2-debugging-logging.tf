# Log Levels
# - INFO
# - WARNING
# - ERROR
# - DEBUG
# - TRACE
# - JSON

# Set the log level we need by the ENV variable TF_LOG
# export TF_LOG=<log_level>
# E.g.
# export TF_LOG=TRACE

# After setting the log level each terraform command 
# will give the relevent logs according to the log level

#! In order to save all terraform logs into a file
#! Set the ENV variable TF_LOG_PATH to the relevant path
# E.g. 
# export TF_LOG_PATH=/tmp/terraform.log

#? Disabling logging JUSR RUN 
# unset TF_LOG_PATH