# State

A special project to get infrastructure up and running.

## Setup

1. Clone the project, cd to `state/`.
2. Comment out the `backend "s3"` section (with all of its properties) in `main.tf` file.
3. Run `terraform init && terraform apply`, review creations and proceed.
4. Copy the output variable from stdout named `s3_bucket_name`.
5. Bring back the `backend "s3"` section in `main.tf`.
6. Modify the `bucket` property to be the s3_bucket_name you have previously copied from stdout of apply.
7. Run `terraform init -migrate-state` and follow prompts.
8. Verify everything is working well with `terraform plan`.
