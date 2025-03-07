terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "~> 1.0"
    }
  }
}

provider "spacelift" {
  # Spacelift API credentials (configure via environment variables)
}

# Generate a unique name for each stack using timestamp
resource "spacelift_stack" "dynamic_stack" {
  name       = "my-stack-${timestamp()}"
  repository = var.repository
  branch     = var.branch
  space_id   = "root"
  description = "Dynamically created stack with cloud integration"

  # Automatically triggers a run after stack creation
  autodeploy = true
}

# AWS Integration (Dynamically Attached)
resource "spacelift_aws_integration" "aws_integration" {
  name     = "aws-integration-${timestamp()}"
  role_arn = var.aws_role_arn
}

# Attach the AWS integration to the new stack
resource "spacelift_aws_integration_attachment" "attach" {
  stack_id        = spacelift_stack.dynamic_stack.id
  integration_id  = spacelift_aws_integration.aws_integration.id
}
