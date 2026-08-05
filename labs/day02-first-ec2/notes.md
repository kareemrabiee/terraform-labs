# Day 02 - AWS Provider & First EC2 Instance

## AWS Authentication

Never use the AWS Root Account.

Create a dedicated IAM User for Terraform.

Recommended permissions for learning:

AdministratorAccess

For production, use least privilege IAM policies.

---

## Multi-Factor Authentication (MFA)

Enable MFA for:

- Root User
- IAM User

This protects against credential theft.

---

## AWS Provider

Terraform communicates with AWS through the AWS Provider.

Example

```hcl
provider "aws" {
  region = "us-east-1"
}
```

---

## Authentication Methods

Environment Variables

AWS CLI Credentials

Named Profile

Assume Role

IAM Role (EC2)

The recommended method for local development is AWS CLI credentials.

---

## AWS CLI Configuration

Configure credentials

```bash
aws configure
```

Verify

```bash
aws sts get-caller-identity
```

---

## First EC2 Resource

Example

```hcl
resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
}
```

Terraform resource syntax

```text
resource "<TYPE>" "<NAME>"
```

TYPE

AWS Resource Type

NAME

Terraform Local Name

---

## Terraform Execution

Initialize

```bash
terraform init
```

Review

```bash
terraform plan
```

Create

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

## Important Notes

AMI IDs are Region Specific.

Every region has different AMIs.

Default VPC may not exist.

Specify subnet_id when necessary.

Always destroy resources after finishing the lab.

---

## Best Practices

Never hardcode AWS credentials.

Always review terraform plan.

Enable Billing Alarm.

Destroy unused resources.

---

## Commands Learned

```bash
aws configure

aws sts get-caller-identity

terraform init

terraform plan

terraform apply

terraform destroy
```

---

## References

AWS Provider

https://registry.terraform.io/providers/hashicorp/aws/latest/docs

AWS CLI

https://docs.aws.amazon.com/cli/

IAM Best Practices

https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html