terraform {
  backend "s3" {
    bucket = "name_of_backend_s3_bucket"
    key    = "terraform-st.tfstate"
    region = "us-east-1"
  }
}