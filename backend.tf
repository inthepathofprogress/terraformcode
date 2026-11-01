terraform {
  backend "s3" {
    bucket         = "myterraformbucketjenkins"
    key            = "infrastructure/prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}