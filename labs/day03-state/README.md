# Day 03 - Terraform State & GitHub Provider

## Objective

Understand Terraform State and manage infrastructure lifecycle.

---

## Topics Covered

- Terraform State
- Desired State
- Current State
- Provider Versioning
- GitHub Provider

---

## Practical Tasks

- Created GitHub Repository
- Explored terraform.tfstate
- Destroyed Infrastructure

---

## Commands

```bash
terraform show

terraform state list

terraform destroy
```

---

## Important Concepts

Terraform compares:

Desired State

↓

Current State

↓

Execution Plan

---

## Files

- providers.tf
- github.tf
- ec2.tf

---

## Lessons Learned

Terraform State is the source of truth.

Never edit terraform.tfstate manually.

Commit .terraform.lock.hcl to Git.

---

Status

Completed ✅