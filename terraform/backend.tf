# Remote state backend (S3)
#
# The backend is intentionally commented out for the FIRST run.
#
# Bootstrap steps:
#   1. On the first run, run `terraform init` WITHOUT this backend block
#      (keep it commented). Terraform will use local state.
#   2. Run `terraform apply` to create the infrastructure, including an
#      S3 bucket to hold remote state (create the state bucket manually or
#      with a separate bootstrap config — do NOT store state in the site bucket).
#   3. Uncomment the block below and fill in your state bucket name.
#   4. Run `terraform init -migrate-state` to move local state into S3.
#
# terraform {
#   backend "s3" {
#     bucket       = "my-terraform-state-bucket"   # <-- replace with your state bucket
#     key          = "portfolio-site/terraform.tfstate"
#     region       = "ap-south-1"                   # <-- match your state bucket region
#     encrypt      = true
#     use_lockfile = true
#   }
# }
