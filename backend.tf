terraform {
  backend "s3" {
    bucket = "oraculi-demo-backend-state-jake-page-goyoaga"
    key    = "terraform-st.tfstate"
    region = "us-east-1"
  }
}