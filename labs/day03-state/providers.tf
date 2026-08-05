provider "aws" {
  region     = "us-east-1"

}

variable "github_token" {
  type        = string
  description = "GitHub token for authentication"
  sensitive   = true
}
provider "github" {
  token = var.github_token
  owner = "kareemrabiee"
}