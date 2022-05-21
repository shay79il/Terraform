resource "aws_dynamodb_table" "cars" {
  name         = "cars"
  hash_key     = "VIN"
  billing_mode = "PAY_PER_REQUEST"

  # attribute - an attribute for each dynamoDB object 
  # type -  "S" stands for type string
  #         "N" stands for type number
  #         "B" stands for type binary
  # For extra data: 
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table#attributes-reference
  attribute {
    name = "VIN"
    type = "S"
  }
}


resource "aws_dynamodb_table_item" "car-items" {
  table_name = aws_dynamodb_table.cars.name
  hash_key   = aws_dynamodb_table.cars.hash_key
  item = jsonencode(
    {
      "Manufacturer" : { "S" : "Toyota" },
      "Make" : { "S" : "Corolla" },
      "Year" : { "N" : "2004" },
      "VIN" : { "S" : "4Y1SL65848Z411439" }
    }
  )
}

