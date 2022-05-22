### This bucket is for storing the codepipeline artifacts
resource "aws_s3_bucket" "main" {
  bucket = "${var.bucket_name}-${var.environment}"
}

resource "aws_s3_bucket_acl" "main" {
  bucket = aws_s3_bucket.main.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = "Enabled"
  }
}

### This bucket is for storing the source code objects 
resource "aws_s3_bucket" "source" {
  bucket = "${var.bucket_name_source}-${var.environment}-source"
}

resource "aws_s3_bucket_acl" "source" {
  bucket = aws_s3_bucket.source.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example_source" {
  bucket = aws_s3_bucket.source.id
  versioning_configuration {
    status = "Enabled"
  }
}
