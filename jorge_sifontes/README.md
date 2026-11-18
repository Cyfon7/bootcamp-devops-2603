# EC2 Instance - Terraform

Terraform configuration to provision an AWS EC2 instance with an associated security group.

## Prompt
- Clone this repository: git@github.com:Cyfon7/bootcamp-devops-2603.git
- From branch tarea-01 create a new branch called tarea-03
- Create a new folder called jorge_sifontes and open it
- Inside the folder create everything necessary to build an EC2 instance
- push the branch to the repository

Kiro's Credits Usage:
   0.72 used / 50 covered in plan

## Resources created

- `aws_instance` — EC2 instance with an encrypted gp3 root volume
- `aws_security_group` — Security group allowing inbound SSH (port 22) and all outbound traffic

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.3.0
- AWS credentials configured (`aws configure` or environment variables)
- An existing EC2 key pair in the target region
- An existing VPC and subnet

## Usage

1. Update `terraform.tfvars` with your values:

   | Variable           | Description                              |
   |--------------------|------------------------------------------|
   | `aws_region`       | AWS region                               |
   | `instance_name`    | Name tag for the instance                |
   | `instance_type`    | EC2 instance type (default: `t3.micro`)  |
   | `ami_id`           | AMI ID (default: Amazon Linux 2023)      |
   | `key_name`         | Existing EC2 key pair name               |
   | `vpc_id`           | Target VPC ID                            |
   | `subnet_id`        | Target subnet ID                         |
   | `root_volume_size` | Root volume size in GB (default: 20)     |
   | `environment`      | Environment tag (default: `dev`)         |
   | `ssh_allowed_cidrs`| CIDRs allowed for SSH access             |

2. Initialize and apply:

```bash
terraform init
terraform plan
terraform apply
```

3. To destroy the resources:

```bash
terraform destroy
```
