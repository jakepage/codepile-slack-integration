module "codepipeline_oraculi_demo" {
  source             = "./codepipeline"
  name               = "codepipeline-oraculi"
  bucket_name        = "codepipeline-artifacts-oraculi"
  bucket_name_source = "oraculi-demo-code"
  source_name        = "Source"
  source_category    = "Source"
  source_owner       = "AWS"
  source_provider    = "S3"
  stage_name         = "Dummy"
  stage_two_name     = "Approval"
  stage_two_category = "Approval"
  stage_two_owner    = "AWS"
  stage_two_provider = "Manual"
  environment        = var.environment
  region             = var.region
}

# Cloudwatch event module for pipeline state changes
module "cloudwatch_for_pipeline_notifications" {
  depends_on        = [module.codepipeline_oraculi_demo]
  source            = "./cloudwatch"
  name              = "codepipeline-state-change"
  description       = "detects event for oraculi pipeline state change"
  role_name         = "cloudwatch-oraculi-role"
  policy_name       = "cloudwatch-oraculi-pipeline-policy"
  targetId          = "SendToLambda"
  codepipeline_arn  = module.codepipeline_oraculi_demo.arn
  codepipeline_name = module.codepipeline_oraculi_demo.name
  resource_arn      = module.lambda_for_pipeline_notifications.arn
  environment       = var.environment
}

# Lambda module for pushing pipeline state change notifications to Slack
module "lambda_for_pipeline_notifications" {
  source        = "./lambda"
  function_name = "lambda-push-pipeline-notification-to-slack"
  source_arn    = module.cloudwatch_for_pipeline_notifications.arn
  lambda_role   = "lambda-oraculi-pipeline-role"
  lambda_policy = "lambda-oraculi-pipeline-policy"
  environment   = var.environment
}