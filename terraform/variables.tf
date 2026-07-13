variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for naming and tagging resources"
  type        = string
  default     = "portfolio-site"
}

variable "environment" {
  description = "Deployment environment (used for tagging)"
  type        = string
  default     = "production"
}

variable "domain_name" {
  description = "Optional custom domain name for the site (leave empty to use the default CloudFront domain)"
  type        = string
  default     = ""
}
