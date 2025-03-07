variable "repository" {
  description = "GitHub or GitLab repository for Spacelift stack"
  type        = string
}

variable "branch" {
  description = "Branch to track in Spacelift"
  type        = string
}

variable "aws_role_arn" {
  description = "AWS IAM Role ARN for Spacelift Integration"
  type        = string
}
