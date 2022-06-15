resource "aws_s3_bucket" "finance" {
  bucket = "finanace-21092020"
  tags = {
    Description = "Finance and Payroll"
  }
}
resource "aws_s3_object" "finance-2020" {
  key     = "finance-2020.doc"
  source = "/root/finance/finance-2020.doc"
  bucket  = aws_s3_bucket.finance.id
}

# data source to IAM GROUP which created manually 
# and we want to be able to referance to it
data "aws_iam_group" "finance-data" {
  group_name = "finance-analysts"
}

resource "aws_s3_bucket_policy" "finance-policy" {
  bucket = aws_s3_bucket.finance.id
  
  # Option 1 - use of a json file
  policy = file("policies/s3-policy.json")

  # Option 2 - use of a json file
  # policy = jsonencode(
  #   {
  #     "Version" : "2012-10-17",
  #     "Statement" : [
  #       {
  #         "Action" : "*",
  #         "Effect" : "Allow",
  #         "Resource" : "arn:aws:s3:::${aws_s3_bucket.finance.id}/*",
  #         "Principal" : {
  #           "AWS" : [
  #             "${data.aws_iam_group.finance-data.arn}"
  #           ]
  #         }
  #       }
  #     ]
  #   }
  # )
}
