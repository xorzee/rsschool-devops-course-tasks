# rsschool-devops-course-tasks

## Project Structure

- `state/`: State backend configuration. Not a module, rather a special case
- `gh_action_role/`: Separate module for GitHub role creation
- `provider.tf`: Provider setup, AWS
- `variables.tf`: Common variables
- `.github/workflows/`:
    - `plan.yml`: Workflow for planning the infra update based on the shared state.
    - `deploy.yml`: Workflow to apply the changeset based on the shared state.

## How to ...

1. **Set Up AWS Credentials**
   In your GitHub repository settings, add the following secrets:
    - `ACTION_ROLE_ARN`: ARN of an AWS IAM role with necessary permissions
   Follow [Creating GitHub OIDC for AWS](documentation/github_oidc_setup.md)

2. **Customize Variables**
   Modify `variables.tf` to set your preferred project name and environment.
   If you are not willing to share variables in VCS, declare them in `terraform.tfvars`.

3. **Run Terraform Plan**
   The plan workflow will run automatically on pull requests to the `main` branch.

4. **Deploy**
   To deploy:
    - Go to the Actions tab in your GitHub repository
    - Select the "Terraform Deploy" workflow
    - Click "Run workflow"
    - Choose the branch and environment, then run

## Notes

- Ensure your AWS IAM role has appropriate permissions for S3 operations.
- Review and adjust the `.github/workflows/*.yml` files if you need to modify the CI/CD process.
- Always review plans before applying changes to your infrastructure.
