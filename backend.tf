terraform {
  backend "s3" {
    bucket = "name_of_your_backend_bucket"
    key    = "terraform-st.tfstate"
    region = "us-east-1"
  }
}