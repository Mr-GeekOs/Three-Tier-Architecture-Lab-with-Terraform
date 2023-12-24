terraform {
  backend "s3" {
    bucket         = "ysn-terraform-backend"
    encrypt        = true
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ysn-terraform-backend-table"
  }
}