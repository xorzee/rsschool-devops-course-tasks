# gh-action-role

This module manages the `GitHubActionRole` configuration, targeting AWS IAM (IDP, Roles).

> **Note:** Be cautious with the `policy_arns` variable in `./github_actions_iam.tf` as it grants extensive permissions.

## AWS IAM OpenID Connect Provider Configuration

### Automated Thumbprint Generation

The AWS Terraform provider requires manual input of the thumbprint list for the `aws_iam_openid_connect_provider` resource. To simplify this process, we've created a script to automatically extract thumbprints from GitHub OIDC certificates.
This script (kind of) follows the [AWS documentation on obtaining certificate thumbprints](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc_verify-thumbprint.html#oidc-obtain-thumbprint) and draws inspiration from [philips-labs/terraform-aws-github-oidc](https://github.com/philips-labs/terraform-aws-github-oidc/blob/b707fe2d3495560278e78e6679ede593fb538e76/bin/generate-thumbprint.sh).

### Usage

The script requires `jq`, `curl`, `openssl` installed.

To generate the thumbprints, run the bash script as:

```shell
./generate-thumbs.sh
```
