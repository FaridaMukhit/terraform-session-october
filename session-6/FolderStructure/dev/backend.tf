terraform {
  backend "s3" {
    bucket         = "aws-session-may2022-backend-farida"
    region         = "us-east-1"
    key            = "session-6/dev/terraform.tfstate"
    dynamodb_table = "terraform-may2022-state-lock-table"
  }
}