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

# Variable Value Precedence (Highest → Lowest)

When the same variable is defined in multiple places, Terraform uses the following priority:

1. CLI flags (`-var` and `-var-file`) **Highest Priority**
2. `*.auto.tfvars` files (loaded automatically)
3. `terraform.tfvars`
4. Environment Variables (`TF_VAR_<name>`)
5. Variable `default` value **Lowest Priority**

Example:

```hcl
variable "instance_type" {
  default = "t2.micro"
}
```

Environment Variable:

```text
TF_VAR_instance_type=t3.micro
```

terraform.tfvars:

```hcl
instance_type = "t3.small"
```

Command:

```bash
terraform apply -var="instance_type=t3.large"
```

Terraform will use:

```text
t3.large
```

Because values passed through the command line have the highest priority.

---

## Lab Summary

During this lab:

- Replaced hardcoded CIDR values with variables.
- Replaced hardcoded port numbers with variables.
- Stored the VPN IP address inside `terraform.tfvars`.
- Used variables across multiple Security Group rules.
- Improved code readability and reusability.

---

## Terraform Variables - Best Practices

### 1. Avoid Hardcoded Values
Avoid writing values directly inside resources. Use variables instead to make the configuration reusable and easier to maintain.

❌ Bad

```hcl
instance_type = "t3.micro"
```

✅ Good

```hcl
variable "instance_type" {}

instance_type = var.instance_type
```

---

### 2. Keep Configurations Generic
Write reusable code that works across multiple environments (Dev, Test, Prod) by changing variable values instead of modifying the Terraform code.

Example:

```hcl
variable "environment" {}

tags = {
  Environment = var.environment
}
```

---

### 3. Use Meaningful Variable Names
Choose clear and descriptive variable names that explain their purpose.

✅ Good

```hcl
instance_type
aws_region
vpc_id
```

❌ Bad

```hcl
x
server
value
```

---

### 4. Store Environment-Specific Values in `.tfvars`
Keep values that change between environments inside `.tfvars` files instead of hardcoding them.

Example:

```hcl
# dev.tfvars
instance_type = "t3.micro"

# prod.tfvars
instance_type = "m5.large"
```

Run:

```bash
terraform apply -var-file="dev.tfvars"
```

---

### 5. Define Default Values Only When Appropriate
Use default values only when they make sense for most deployments. Avoid defaults for sensitive or environment-specific values.

```hcl
variable "instance_type" {
  default = "t3.micro"
}
```

---

### 6. Reuse Variables
Reuse variables instead of repeating the same value in multiple places. This improves maintainability and makes updates easier.

```hcl
variable "instance_type" {
  default = "t3.micro"
}

resource "aws_instance" "web1" {
  instance_type = var.instance_type
}

resource "aws_instance" "web2" {
  instance_type = var.instance_type
}
```

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