terraform {
  backend "s3" {
    bucket = "my-terraform-udemy-lab"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
