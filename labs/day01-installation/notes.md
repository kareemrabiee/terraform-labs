# Day 01 - Installation & Infrastructure as Code

## What is Infrastructure as Code (IaC)

Infrastructure as Code (IaC) is the process of managing and provisioning infrastructure using configuration files instead of manual operations.

Instead of creating resources manually through the AWS Console, Terraform creates them from code.

Benefits:

- Version Control
- Automation
- Repeatability
- Consistency
- Reduced Human Error
- Easy Collaboration

---

## Why Terraform

Terraform is an Infrastructure as Code tool developed by HashiCorp.

Terraform supports hundreds of providers including:

- AWS
- Azure
- Google Cloud
- GitHub
- Kubernetes
- Docker
- Cloudflare

Terraform is declarative.

You describe the desired infrastructure.

Terraform determines how to build it.

---

## Declarative vs Imperative

Declarative

You describe the final desired state.

Example:

Create one EC2 instance.

Terraform decides the execution steps.

Imperative

You specify every command in order.

Example:

Create network

Create subnet

Launch instance

Attach security group

---

## Terraform Workflow

terraform init

Downloads providers and initializes the working directory.

terraform plan

Shows execution plan.

No resources are created.

terraform apply

Creates or updates infrastructure.

terraform destroy

Deletes managed infrastructure.

---

## Installation Verification

Check installed version

```bash
terraform version
```

Expected output

```bash
Terraform v1.x.x
```

---

## VS Code Extensions

Recommended

- HashiCorp Terraform
- Error Lens
- GitLens
- YAML
- Markdown All in One

---

## Project Structure

Example

```text
terraform-labs/
│
├── day01-installation/
│   ├── versions.tf
│   └── providers.tf
```

---

## versions.tf

Example

```hcl
terraform {
  required_version = ">= 1.5.0"
}
```

---

## providers.tf

Provider configuration will be added in later labs.

---

## Best Practices

Always install Terraform from the official website.

Pin the required Terraform version.

Keep one project per folder.

Use Git from the beginning.

Never work directly from Downloads.

---

## Commands Learned

```bash
terraform version
terraform -help
```

---

## References

Terraform Installation

https://developer.hashicorp.com/terraform/install

Terraform CLI

https://developer.hashicorp.com/terraform/cli

What is Terraform

https://developer.hashicorp.com/terraform/intro