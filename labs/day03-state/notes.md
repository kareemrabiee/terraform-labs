# Day 03 - Providers & Terraform State

## Provider

A provider is a plugin that allows Terraform to communicate with external APIs.

Examples

AWS

GitHub

Azure

Google Cloud

Docker

Kubernetes

---

## Provider Version

Specify provider versions to avoid unexpected upgrades.

Example

```hcl
terraform {

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 6.0"

    }

  }

}
```

---

## Terraform State

Terraform stores infrastructure information inside the state file.

Default file

```text
terraform.tfstate
```

Terraform compares

Current State

Desired State

and generates an execution plan.

---

## Desired State

Defined in Terraform configuration.

Example

One EC2 instance.

---

## Current State

Stored inside terraform.tfstate.

Represents actual managed infrastructure.

---

## State Lifecycle

Write

Read

Refresh

Compare

Update

---

## Why State is Important

Tracks resource IDs

Maps resources

Stores metadata

Detects changes

Supports updates

Supports destroy operations

---

## terraform destroy

Deletes all resources managed by the current state.

Always verify before running.

---

## Terraform Refresh

Synchronizes Terraform State with actual infrastructure.

Modern Terraform automatically refreshes during plan and apply.

---

## Provider Versioning

Pin versions.

Avoid latest in production.

Example

```hcl
version = "~> 6.0"
```

---

## GitHub Provider

Terraform can also manage GitHub repositories.

Example

```hcl
resource "github_repository" "repo" {

  name = "terraform-demo"

}
```

---

## Lock File

Terraform generates

```text
.terraform.lock.hcl
```

Purpose

Locks provider versions.

Keep this file in Git.

---

## Best Practices

Never edit terraform.tfstate manually.

Do not upload terraform.tfstate to GitHub.

Commit .terraform.lock.hcl.

Pin provider versions.

Always understand the execution plan before applying.

---

## Commands Learned

```bash
terraform init

terraform plan

terraform apply

terraform destroy

terraform show

terraform state list
```

---

## References

Terraform State

https://developer.hashicorp.com/terraform/language/state

Providers

https://developer.hashicorp.com/terraform/language/providers

Provider Registry

https://registry.terraform.io