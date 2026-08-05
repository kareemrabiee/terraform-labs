# Day 05 - Variables

## Overview

Terraform variables allow values to be passed into a configuration instead of hardcoding them.

Using variables makes Terraform configurations reusable, flexible, and easier to maintain across different environments.

---

## Declaring Variables

Variables are declared using the `variable` block.

Example

```hcl
variable "vpn-ip" {}

variable "https-port" {
  default = 443
}

variable "http-port" {
  default = 80
}

variable "ssh-port" {
  default = 22
}

variable "ftp-port" {
  default = 21
}
```

Variables are referenced using the `var` object.

Example

```hcl
cidr_ipv4 = var.vpn-ip

from_port = var.https-port

to_port = var.https-port
```

---

## Why Variables

Without variables

```hcl
cidr_ipv4 = "177.98.32.54/32"

from_port = 443
```

With variables

```hcl
cidr_ipv4 = var.vpn-ip

from_port = var.https-port
```

Changing the value now requires modifying only one place instead of updating multiple resources.

---

## Default Values

Variables may contain a default value.

Example

```hcl
variable "https-port" {
  default = 443
}
```

If no value is provided, Terraform automatically uses the default value.

---

## terraform.tfvars

Terraform automatically loads values from the `terraform.tfvars` file.

Example

```hcl
vpn-ip = "177.98.32.54/32"
```

This separates configuration values from the Terraform code.

---

## Variable Assignment Approaches

Terraform supports multiple ways to assign variable values.

- Default value inside `variables.tf`
- `terraform.tfvars`
- Custom variable files (`-var-file`)
- Command line (`-var`)
- Environment variables (`TF_VAR_*`)

The lab focused on using `terraform.tfvars`.

---

## Variable Precedence

If the same variable is defined in multiple places, Terraform follows a precedence order to determine which value to use.

Highest priority

1. Command line (`-var`)
2. Variable file (`-var-file`)
3. Environment variables (`TF_VAR_*`)
4. `terraform.tfvars`
5. Default value

---

## Lab Summary

During this lab:

- Replaced hardcoded CIDR values with variables.
- Replaced hardcoded port numbers with variables.
- Stored the VPN IP address inside `terraform.tfvars`.
- Used variables across multiple Security Group rules.
- Improved code readability and reusability.

---

## Best Practices

- Avoid hardcoded values whenever possible.
- Keep Terraform configurations generic.
- Use meaningful variable names.
- Store environment-specific values in `.tfvars` files.
- Define default values only when appropriate.
- Reuse variables instead of duplicating values.

---

## Commands Used

```bash
terraform validate

terraform plan

terraform apply

terraform destroy
```

---

## References

Terraform Variables

https://developer.hashicorp.com/terraform/language/values/variables

Variable Definition Files

https://developer.hashicorp.com/terraform/language/values/variables#variable-definitions-tfvars-files

Input Variables

https://developer.hashicorp.com/terraform/language/values/variables