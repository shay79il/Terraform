resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Technical Team Leader"
  }
}


# Option 1
###########
# resource "aws_iam_policy" "adminUser" {
#   name   = "AdminUsers"
#   policy = jsonencode(
#     {
#       "Version": "2012-10-17",
#       "Statement": [
#         {
#           "Effect": "Allow",
#           "Action": "*",
#           "Resource": "*"
#         }
#       ]
#     })
# }

# Option 2 - use of a json file
##################################
resource "aws_iam_policy" "adminUser" {
  name   = "AdminUsers"
  policy = file("policies/admin-policy.json")
}




resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
  user        = aws_iam_user.admin-user.name
  policy_arn  = aws_iam_policy.adminUser.arn
}