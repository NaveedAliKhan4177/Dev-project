#
# Cognito User Pool + App Client
#

###############################
#   User Pool
###############################

resource "aws_cognito_user_pool" "this" {
  name = "${var.name}-user-pool"

  mfa_configuration = "OFF"

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = false
    require_uppercase = true
  }

  auto_verified_attributes = ["email"]
}

###############################
#   User Pool App Client
###############################

resource "aws_cognito_user_pool_client" "client" {
  name         = "${var.name}-userpool-client"
  user_pool_id = aws_cognito_user_pool.this.id

  generate_secret = false

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]

  prevent_user_existence_errors = "ENABLED"
}

