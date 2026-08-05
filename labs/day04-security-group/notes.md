# Day 04 - AWS Security Groups, Resource Attributes & Outputs

## AWS Security Groups

A Security Group is a stateful virtual firewall that controls inbound and outbound traffic for AWS resources.

Unlike Network ACLs, Security Groups are attached directly to resources such as EC2 instances.

Characteristics

- Stateful
- Instance-level firewall
- Supports Allow rules only
- Default inbound: Deny All
- Default outbound: Allow All

Terraform manages Security Groups using the `aws_security_group` resource.

Example

```hcl
resource "aws_security_group" "web_sg" {
  name = "web-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

---

## Security Group Rules

Ingress

Controls incoming traffic to the resource.

Example

```hcl
ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["YOUR_PUBLIC_IP/32"]
}
```

Egress

Controls outgoing traffic from the resource.

Example

```hcl
egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
```

---

## Resource Attributes

Every Terraform resource exposes attributes after creation.

Common attributes

- id
- arn
- public_ip
- private_ip
- availability_zone
- owner_id

Example

```hcl
aws_instance.web.public_ip
```

Terraform automatically retrieves the value after the resource is created.

---

## Cross Resource Attribute References

Resources should reference other resources instead of using hardcoded values.

Correct

```hcl
vpc_security_group_ids = [
  aws_security_group.web_sg.id
]
```

Incorrect

```hcl
vpc_security_group_ids = [
  "sg-0ab123456789"
]
```

Benefits

- Automatic dependency handling
- Easier maintenance
- Better readability
- Less human error
- More reusable code

---

## Implicit Dependency

Terraform automatically builds a dependency graph when one resource references another.

Example

```hcl
resource "aws_instance" "web" {

  ami = "ami-xxxxxxxx"

  instance_type = "t3.micro"

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]
}
```

Terraform creates the Security Group before launching the EC2 instance.

No additional configuration is required.

---

## Elastic IP

Elastic IP (EIP) is a static public IPv4 address.

Typical use cases

- Bastion Hosts
- Web Servers
- DNS records
- Stable public endpoints

Terraform resource

```hcl
resource "aws_eip" "web_ip" {}
```

Useful attribute

```hcl
aws_eip.web_ip.public_ip
```

---

## Outputs

Outputs display useful values after infrastructure is created.

Example

```hcl
output "public_ip" {
  value = aws_instance.web.public_ip
}
```

Outputs are commonly used to expose

- Public IP
- Private IP
- ARN
- Resource IDs
- DNS Names

Outputs can also be consumed by

- Modules
- Remote State
- Automation pipelines
- CI/CD workflows

---

## Common Errors

Using a VPC ID where a CIDR block is required.

Incorrect

```hcl
cidr_ipv4 = "vpc-0123456789"
```

Correct

```hcl
cidr_ipv4 = "0.0.0.0/0"
```

Using strings instead of Terraform references.

Incorrect

```hcl
"sg-0123456789"
```

Correct

```hcl
aws_security_group.web_sg.id
```

Trying to access attributes before the resource exists.

Opening unnecessary ports to the Internet.

Using multiple Security Groups when a single one is sufficient.

---

## Best Practices

Use resource references instead of hardcoded IDs.

Allow only required inbound ports.

Restrict SSH access to your public IP whenever possible.

Avoid exposing sensitive services to the Internet.

Use descriptive Security Group names.

Keep Security Groups focused on a single purpose.

Expose only useful outputs.

Never expose secrets using outputs.

Always review the execution plan before applying changes.

---

## Commands Learned

```bash
terraform validate

terraform plan

terraform apply

terraform output

terraform show

terraform state list

terraform destroy
```

---

## References

AWS Security Group Resource

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

AWS Security Group Ingress Rule

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule

AWS Security Group Egress Rule

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule

Terraform Resource References

https://developer.hashicorp.com/terraform/language/expressions/references

Terraform Outputs

https://developer.hashicorp.com/terraform/language/values/outputs