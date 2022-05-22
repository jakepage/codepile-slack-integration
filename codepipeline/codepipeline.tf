resource "aws_codepipeline" "codepipeline" {
  name     = "${var.name}-${var.environment}"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
      location = aws_s3_bucket.main.bucket
      type     = "S3"
  }

  stage {
      name = "Source"

      action {
        name             = var.source_name
        category         = var.source_category
        owner            = var.source_owner
        provider         = var.source_provider
        version          = var.source_version
        output_artifacts = ["test"]

        configuration = {
          S3Bucket    = aws_s3_bucket.source.bucket
          S3ObjectKey = "test"
        }
      }
    }

  stage {
      name = var.stage_name

      action {
        name             = var.stage_two_name
        category         = var.stage_two_category
        owner            = var.stage_two_owner
        provider         = var.stage_two_provider
        version          = var.stage_two_version
        output_artifacts = []
    }
  }
}