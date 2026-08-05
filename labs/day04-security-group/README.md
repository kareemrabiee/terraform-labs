# Day 04 - Security Groups & Resource References

## Objective

Create Security Groups and understand resource dependencies.

---

## Topics Covered

- Security Groups
- Firewall Rules
- Attributes
- Outputs
- Cross Resource References

---

## Practical Tasks

- Created Security Group
- Attached EC2 to Security Group
- Used Outputs

---

## Resources

- aws_security_group
- aws_instance
- aws_eip

---

## Commands

```bash
terraform plan
terraform apply
terraform output
terraform destroy
```

---

## Lessons Learned

Terraform automatically builds dependency graphs.

Resource references are preferred over hardcoded IDs.

---

Status

Completed ✅