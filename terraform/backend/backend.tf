
terraform {
    backend "s3" {
        bucket = "terraform-state-bucket"
        key = "eks/dev/terrafrom.tfstate"
        region ="us-east-1"
        dynamodb_table = "terraform-locks"
        encrypt = true
    }
}