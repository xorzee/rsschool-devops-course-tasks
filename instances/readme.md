# 🎼 instances

## Components

- Bastion and private instance configuration
- Security groups for Bastion + private instance

## Files

- `ami.tf`: AMI selector, we are using Amazon Linux 2 x86_64
- `bastion.tf`: Bastion instance configuration secured by KeyPair.
- `private_instance.tf`: 2 private instances example configuration
- `private_instance.tf`: 2 public instances example configuration
- `security_groups.tf`: Security group configurations for bastion and private instances.

## Get a .pem Key from AWS

- Log in to AWS Console and navigate to EC2 Dashboard
- Access "Key Pairs" "Network & Security" in the left sidebar.
- Create a New Key Pair select "pem".
- Download the .pem File (it's automatically downloaded by the browser)
- Save this file in a secure location on your computer.
- Run `chmod 400 your-key-name.pem`

You can create local `.tfvars` file at the root directory and add value there, e.g.:
```terraform
security_ec2_key_pair_name = "my-shiny-key-pair-name"
```

> Remember: Never share your .pem file. It's the private key used to access your EC2 instances.

## Accessing Private Instances

To access instances in the private subnets:

1. Configure identity
   ```shell
   ssh-add your-key.pem
   ```
2. Connect to the bastion host using SSH with agent forwarding enabled (`-A` flag. Check `man ssh` for more):
   ```shell
   ssh -i your-key.pem -A ec2-user@<bastion-public-ip>
   ```
3. From the bastion host, connect to private instances:
   ```shell
   ssh ec2-user@<private-instance-ip>
   ```
