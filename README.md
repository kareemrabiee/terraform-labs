# Terraform Labs

A collection of hands-on Terraform labs completed while studying the **HashiCorp Certified: Terraform Associate (003/004)** course.

This repository documents my practical journey in learning Infrastructure as Code (IaC) using Terraform. Each lab focuses on a single concept and includes the Terraform configuration, documentation, and personal notes created during the learning process.

The primary goal of this repository is to build a solid Terraform foundation before moving to production-grade infrastructure projects.

---

## Learning Objectives

- Understand Infrastructure as Code (IaC)
- Learn the Terraform workflow
- Deploy AWS resources using Terraform
- Work with Providers and Resources
- Understand Terraform State
- Use Variables and Outputs
- Create and manage Security Groups
- Reference Resource Attributes
- Work with Local Values and Data Sources
- Use Count and Conditional Expressions
- Build reusable Terraform Modules
- Configure Remote State
- Apply Terraform Best Practices

---

## Repository Structure

```text
terraform-labs/
│
├── .gitignore
├── .terraform.lock.hcl
├── LICENSE
├── README.md
│
└── labs/
    │
    ├── day01-installation/
    │   ├── README.md
    │   ├── NOTES.md
    │   ├── versions.tf
    │   └── providers.tf
    │
    ├── day02-first-ec2/
    │   ├── README.md
    │   ├── NOTES.md
    │   ├── versions.tf
    │   ├── providers.tf
    │   ├── ec2.tf
    │   └── outputs.tf
    │
    ├── day03-state/
    │   ├── README.md
    │   ├── NOTES.md
    │   ├── versions.tf
    │   ├── providers.tf
    │   ├── ec2.tf
    │   └── outputs.tf
    │
    ├── day04-security-group/
    │   ├── README.md
    │   ├── NOTES.md
    │   ├── versions.tf
    │   ├── providers.tf
    │   ├── sg.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── day05-variables/
        ├── README.md
        ├── NOTES.md
        ├── versions.tf
        ├── providers.tf
        ├── variables.tf
        ├── sg.tf
        ├── terraform.tfvars
        ├── dev.tfvars
        ├── prod.tfvars
        └── eip.tf.bak
```

---

## Learning Progress

| Day | Topic | Status |
|------|-----------------------------|-----------|
| 01 | Installation & Infrastructure as Code | Completed |
| 02 | First EC2 Instance | Completed |
| 03 | Terraform State | Completed |
| 04 | Security Groups | Completed |
| 05 | Variables | Completed |
| 06 | Functions & Count | In Progress |
| 07 | Data Sources | Planned |
| 08 | Dynamic Blocks | Planned |
| 09 | Meta Arguments | Planned |
| 10 | Modules | Planned |
| 11 | Advanced Modules | Planned |
| 12 | Remote State | Planned |
| 13 | Import & Sensitive Values | Planned |
| 14 | Final Lab | Planned |

---

## Prerequisites

Before running any lab, install the following tools:

- Terraform
- AWS CLI
- Git
- Visual Studio Code
- AWS Account
- GitHub Account

---

## Terraform Workflow

Initialize the working directory

```bash
terraform init
```

Format Terraform files

```bash
terraform fmt
```

Validate configuration

```bash
terraform validate
```

Review execution plan

```bash
terraform plan
```

Create infrastructure

```bash
terraform apply
```

Destroy infrastructure

```bash
terraform destroy
```

---

## Repository Notes

This repository is intended for learning and experimentation.

Each lab is isolated in its own directory to simplify learning and keep Terraform state independent.

Terraform variable files included in this repository contain only non-sensitive configuration values used for learning purposes.

No AWS credentials, access keys, personal access tokens, passwords, or other secrets are stored in this repository.

Terraform state files, provider cache, and temporary files are excluded from version control using `.gitignore`.

---

## Best Practices

- Write Terraform code manually instead of copying examples.
- Keep one Terraform project per directory.
- Always run `terraform fmt` before committing.
- Validate configurations before applying changes.
- Review the execution plan before creating resources.
- Destroy unused resources to avoid unnecessary AWS charges.
- Never commit credentials or secrets to Git.
- Pin Terraform and Provider versions whenever possible.

---

## References

Terraform Documentation

https://developer.hashicorp.com/terraform/docs

Terraform CLI

https://developer.hashicorp.com/terraform/cli

Terraform Registry

https://registry.terraform.io/

AWS Provider Documentation

https://registry.terraform.io/providers/hashicorp/aws/latest/docs

HashiCorp Learn

https://developer.hashicorp.com/terraform/tutorials

---

## Author

**Kareem Rabie**

AWS Cloud | DevOps | Cloud Security

LinkedIn

https://www.linkedin.com/in/kareem-rabie

GitHub

https://github.com/kareemrabiee

---

## License

This project is licensed under the MIT License.