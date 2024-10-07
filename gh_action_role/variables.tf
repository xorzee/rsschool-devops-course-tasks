variable "role_name" {
  type        = string
  description = "Name of the IAM role for GitHub Actions"
  default     = "GithubActionsRole"
}

variable "github_username" {
  type = string
  default = "xorzee"
}

variable "github_repository" {
  type = string
  default = "rsschool-devops-course-tasks"
}
