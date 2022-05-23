# CodePipeline-Slack Integration

Here we have sample terraform code to configure a simple AWS CodePipeline integration with a slack channel of your choosing to communicate status changes in code pipelines. 

In order to use you will need to add the **name of an S3 bucket** that will hold your backend state, found in the backend.tf file, in the root of the repository.

You will also need to generate and add the **incoming slack webhook** lambda/function_src/index.js.
Instructions on how to generate the webhook here: https://slack.com/help/articles/115005265063-Incoming-webhooks-for-Slack

Happy integration!
