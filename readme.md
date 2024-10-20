# rsschool-devops-course-tasks

## Project Structure

- `gh_action_role/`: Separate module for GitHub role creation
- `network/`: Separate module for networking (VPC) configuration
- `instances/`: Separate module for EC2 instance management
- `provider.tf`: Provider setup for the main project
- `variables.tf`: Common variables, such as region
- `.github/workflows/`:
    - `plan-and-deploy.yml`: Workflow for planning and deploying the infra update based on the shared state.
- `state/`: State backend configuration. Not a module, rather a special case

## How to ...

1. **Set Up AWS Credentials**
   In your GitHub repository settings, add the following secrets:
    - `ACTION_ROLE_ARN`: ARN of an AWS IAM role with necessary permissions

2. **Customize Variables**
   Modify `variables.tf` to set your preferred project name and environment.
   If you are not willing to share variables in VCS, declare them in `terraform.tfvars`.

3. **Run CI / CD**
   The plan workflow will run automatically on pull requests to the `main` branch, and on merged PRs to `main`.

## Notes

- Review and adjust the `.github/workflows/*.yml` files if you need to modify the CI/CD process.
- Always review plans before applying changes to your infrastructure.
- Follow [Instances](./instances/readme.md) before running the script.

## State bucket structure

- `_main.tfstate` – organizes the main project's state object.
- `coreinfra.tfstate` – the "metastate" object.
