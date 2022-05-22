####################
# Numeric Operators
####################

#! > 1 + 2
# Console output:
# 3

#! > 5 - 3
# Console output:
# 2

#! > 2 * 2
# Console output:
# 4

#! > 8 / 2
# Console output:
# 4


####################
# Equality Operators
####################

#! > 8 == 8
# Console output:
# true       

#! > 8 == 7
# Console output:
# false      

#! > 8 != "8"
# Console output:
# true



######################
# Comparison Operators
######################

#! > 5 > 7
# Console output:
# false

#! > 5 > 4
# Console output:
# true

#! > 5 > 5
# Console output:
# False

#! > 5 >= 5
# Console output:
# true

#! > 4 < 5
# Console output:
# true

#! # > 3 <= 4
# Console output:
# true


######################
# Logical Operators
######################

#! > 8 > 7 && 8 < 10
# Console output:
# true

#! > 8 > 10 && 8 < 10
# Console output:
# false

#! > 8 > 9 || 8 < 10
# Console output:
# True

# When we have:
variable special {
  type = bool
  default = true
  description = "Set to true to  use special characters"
}
#! > var.special
# Console output:
# true

#! > ! var.special
# Console output:
# false

# When we have:
variable a {
  type = number
  default = 50
}

variable b {
  type = number
  default = 25
}

#! > ! (var.b > 30)
# Console output:
# true

#! > var.a > var.b
# Console output:
# true

#! > var.a < var.b
# Console output:
# false

#! > var.a + var.b
# Console output:
# 75

##################################
# condition ? true_val : false_val
##################################

resource "random_password" "password-generator" {
  length = var.length < 8 ? 8 : var.length
}

output password {
  value = random_password.password-generator.result
}

variable length {
  type = number
  description = "The length of the password"
}










