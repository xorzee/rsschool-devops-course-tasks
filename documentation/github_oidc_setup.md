# Creating GitHub OIDC for AWS (Manually)

This guide walks you through setting up OpenID Connect (OIDC) between GitHub and AWS. We'll use trust relationships and AWS Security Token Service (STS) to generate access based on trust, avoiding direct credential usage.

## Prerequisites

- AWS IAM user with console access
- Full permission set for IAM service

## Steps

### 1. Add GitHub as an Identity Provider

1. Navigate to the IAM service in the AWS console
2. Click on "Identity providers"
3. Select "Add provider"
4. Choose OpenID Connect
5. Provider URL: `https://token.actions.githubusercontent.com`
6. Audience: `sts.amazonaws.com`

### 2. Create a Role for the GitHub Action

1. Go to the IAM dashboard and navigate to "Roles"
2. Click "Create role"
3. For Trusted entity type, choose "Web identity"
4. Complete the Web identity form:
    - Identity provider: `token.actions.githubusercontent.com`
    - Audience: `sts.amazonaws.com`
    - GitHub organization: Your GitHub username
    - GitHub repository: Your repository name
5. Click "Next"

### 3. Assign Role Permissions

Add the following permissions to your role:
- `AmazonEC2FullAccess`
- `AmazonRoute53FullAccess`
- `AmazonS3FullAccess`
- `IAMFullAccess`
- `AmazonVPCFullAccess`
- `AmazonSQSFullAccess`
- `AmazonEventBridgeFullAccess`

> Note: In production environments, always follow the principle of least privilege when assigning permissions. For our course, this will do.

### 4. Review and Create Role

1. Name your role (e.g., `GithubActionsRole`)
2. Review permissions and trusted entities
3. Click "Create Role"

### 5. Test the Setup

Create a GitHub action with the following YAML:

```yaml
name: AWS Credentials Example

on:
  push:
    branches: [ main ]

permissions:
   id-token: write  # Required for OIDC

jobs:
  check-aws-identity:
    runs-on: ubuntu-latest
    
    steps:
    - name: Configure AWS Credentials
      uses: aws-actions/configure-aws-credentials@v4
      with:
        role-to-assume: arn:aws:iam::123456789012:role/GithubActionsRole
        aws-region: us-east-1

    - name: Get caller identity
      run: |
        aws sts get-caller-identity
```

Replace `arn:aws:iam::123456789012:role/GithubActionsRole` with your actual role ARN.

That's it! You've successfully set up OIDC between GitHub and AWS.

# OR!

Just do targeted terraform apply for resources defined in `gh_action_role/` directory under project root.
