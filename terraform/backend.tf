terraform {
  backend "s3" {
    bucket         = "sai-eks-tf-state-us-east-1"
    key            = "eks/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}