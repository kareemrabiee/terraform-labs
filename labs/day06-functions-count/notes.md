# Day 06 - Data Types, Count & Functions

---

# Learning Objectives

By the end of this lesson you should understand:

- Terraform Data Types
- String, Number and Boolean
- List Data Type
- Map Data Type
- Accessing Values from Lists and Maps
- Count Meta-Argument
- count.index
- Conditional Expressions
- Terraform Built-in Functions
- Terraform Console

---

# Why This Lesson Matters

Until Day 05 we learned how to make Terraform code configurable using variables.

Starting from Day 06, we learn how to make Terraform configurations **smarter**.

Instead of writing repetitive code, Terraform allows us to:

- store multiple values
- organize data
- create multiple resources
- make decisions
- use built-in helper functions

These concepts are used in almost every production Terraform project.

---

# 1. Terraform Data Types

## What are Data Types?

A Data Type defines the kind of value that a variable can store.

Think of it as a rule that tells Terraform what type of information is expected.

Example:

```

String → "Hello"

Number → 5

Boolean → true

```

Using data types makes Terraform configurations:

- safer
- easier to understand
- easier to maintain

---

# Why are Data Types Important?

Without data types:

- users can accidentally provide wrong values
- Terraform cannot validate inputs correctly
- infrastructure may fail during deployment

Example

Wrong

```

instance_count = "five"

```

Correct

```

instance_count = 5

```

---

# Common Terraform Data Types

| Data Type | Description | Example |
|-----------|-------------|---------|
| string | Text value | "t2.micro" |
| number | Numeric value | 3 |
| bool | True or False | true |
| list | Ordered collection | ["web","db"] |
| map | Key-value pairs | {Env="Dev"} |
| null | Represents no value | null |

The KPLabs notes introduce these core data types before moving into List and Map in detail. :contentReference[oaicite:1]{index=1}

---

# String

Stores text.

Example

```hcl
variable "instance_type" {
  type = string
}
```

Usage

```hcl
instance_type = "t2.micro"
```

AWS Examples

- EC2 instance type
- IAM username
- S3 bucket name
- AWS Region

---

# Number

Stores numeric values.

Example

```hcl
variable "instance_count" {
  type = number
}
```

Usage

```hcl
instance_count = 3
```

AWS Examples

- Number of EC2 instances
- Number of EBS volumes
- Port numbers

---

# Boolean

Stores only

```

true

false

```

Example

```hcl
variable "enable_monitoring" {
  type = bool
}
```

Usage

```hcl
enable_monitoring = true
```

AWS Examples

- Enable detailed monitoring
- Enable deletion protection
- Enable encryption

---

# Best Practice

Always define the variable type.

Good

```hcl
variable "instance_type" {
  type = string
}
```

Avoid

```hcl
variable "instance_type" {}
```

Explicit types make configurations easier to validate and understand.

---

# 2. List Data Type

## What is a List?

A List stores multiple values in a single variable.

Instead of creating several variables

```

sg1

sg2

sg3

```

We store them together

```hcl
["sg-web","sg-ssh","sg-monitoring",15,true]
```

---

# Syntax
to store values of the the types:

```hcl
variable "security_groups" {
  type = list(string)

  default = [
    "web",
    "ssh"
  ]
}
```

The course notes describe a list as an ordered collection represented by square brackets, useful when multiple values are required for one argument. :contentReference[oaicite:2]{index=2}

---

# Real AWS Example

An EC2 instance can belong to multiple Security Groups.

```hcl
vpc_security_group_ids = [
  aws_security_group.web.id,
  aws_security_group.ssh.id
]
```

Visualization

```

EC2

│

├── Web Security Group

│

└── SSH Security Group

```

This is a common production pattern.

---

# Accessing List Values

Terraform uses indexes.

```hcl
var.security_groups[0]
```

returns

```

web

```

Example

```hcl
variable "regions" {

type = list(string)

default = [
"us-east-1",
"eu-west-1",
"ap-south-1"
]

}
```

Access

```hcl
var.regions[1]
```

returns

```

eu-west-1

```

---

# Production Use Cases

Lists are commonly used for

- Security Groups
- Availability Zones
- Subnets
- IP Addresses
- IAM Policies
- Multiple CIDR Blocks

---

# Best Practices

✔ Keep related values together.

✔ Use meaningful ordering.

✔ Keep all items the same type.

Good

```hcl
["web","db","cache"]
```

Avoid

```hcl
["web",10,true]
```

unless mixed values are intentionally required.

---

# Common Mistakes

❌ Using an invalid index

```hcl
var.regions[5]
```

when only three values exist.

Result

```

Invalid index

```

Solution

Verify the number of elements before referencing them.

---

# Interview Question

**Q:** Why use a List instead of multiple variables?

**Answer**

Because a list groups related values into a single variable, making the configuration cleaner, easier to maintain, and easier to scale.

---

# 3. Map Data Type

## What is a Map?

A Map stores information as **key-value pairs**.

Instead of relying on positions like a list, each value is identified by a unique key.

Example

```hcl
{
  Dev  = "t2.micro"
  Prod = "m5.large"
}
```

According to the course notes, a map represents a collection of key-value pair elements and is commonly used for AWS tags. :contentReference[oaicite:3]{index=3}

---

# Why Maps?

Maps make configurations easier to read because values are accessed by name rather than by index.

Bad example

```
server_type[0]
```

Better example

```
server_type["Production"]
```

The second example is much easier to understand.

---

---

# Accessing Map Values

Terraform retrieves values from a map using the **key** instead of an index.

## Syntax

```hcl
variable "instance_types" {
  type = map(string)

  default = {
    dev  = "t2.micro"
    test = "t2.small"
    prod = "m5.large"
  }
}
```

Access a specific value:

```hcl
var.instance_types["prod"]
```

Output

```
m5.large
```

Unlike Lists, Maps do **not** use numeric indexes.

---

# Real AWS Example

One of the most common uses of Maps in AWS is **Resource Tags**.

```hcl
tags = {
  Name        = "Web-Server"
  Environment = "Development"
  Owner       = "Cloud Team"
}
```

Visualization

```
EC2 Instance
│
├── Name = Web-Server
├── Environment = Development
└── Owner = Cloud Team
```

Every production environment relies heavily on resource tagging for:

- Cost Allocation
- Automation
- Monitoring
- Security Policies
- Resource Organization

---

# List vs Map

| List | Map |
|------|-----|
| Ordered collection | Key-Value collection |
| Access by Index | Access by Key |
| Example: `["web","db"]` | Example: `{dev="t2.micro"}` |
| Best for sequences | Best for named values |

---

# Choosing Between List and Map

Use **List** when:

- Order matters
- Multiple similar values
- Security Groups
- Subnets
- Availability Zones

Use **Map** when:

- Values have names
- Tags
- Environment settings
- Configuration values

---

# 4. Count Meta-Argument

## What is Count?

Normally, one Terraform resource creates **one infrastructure object**.

Example

```hcl
resource "aws_instance" "web" {

}
```

↓

```
One EC2 Instance
```

But sometimes we need multiple identical resources.

Instead of writing

```hcl
resource "aws_instance" "server1" {}

resource "aws_instance" "server2" {}

resource "aws_instance" "server3" {}
```

Terraform provides **Count**.

The course introduces Count as a meta-argument that creates multiple instances from a single resource block. :contentReference[oaicite:0]{index=0}

---

# Syntax

```hcl
resource "aws_instance" "web" {

  count = 3

  ami           = var.ami
  instance_type = "t2.micro"

}
```

Terraform creates

```
EC2-1

EC2-2

EC2-3
```

using a single block.

---

# Why Count?

Imagine deploying

- 10 Web Servers
- 20 Test Servers
- 5 Jump Servers

Without Count

```
30 Resource Blocks
```

With Count

```
One Resource Block
```

This significantly reduces duplicated code.

---

# Production Example

Development Environment

```
2 EC2 Instances
```

Production Environment

```
8 EC2 Instances
```

Changing one number is easier than copying many resource blocks.

---

# Best Practices

Use Count only when:

✔ Resources are almost identical.

✔ The only difference is the number of instances.

Avoid using Count when every resource requires different configuration.

---

# Common Mistakes

❌

```hcl
count = "3"
```

Correct

```hcl
count = 3
```

Count expects a **number**, not a string.

---

# 5. count.index

Creating multiple resources introduces another challenge.

Suppose we create three IAM Users.

Without unique names

```
developer

developer

developer
```

AWS rejects duplicate usernames.

Terraform solves this using **count.index**. The course explains that `count.index` starts from **0** and uniquely identifies each created resource. :contentReference[oaicite:1]{index=1}

---

# Example

```hcl
resource "aws_iam_user" "developer" {

  count = 3

  name = "developer-${count.index}"

}
```

Terraform creates

```
developer-0

developer-1

developer-2
```

---

# Resource Addresses

Terraform internally tracks each resource using an index.

```
aws_instance.web[0]

aws_instance.web[1]

aws_instance.web[2]
```

This makes every instance unique.

---

# Interview Tip

Question

Why does count.index start at zero?

Answer

Because Terraform follows zero-based indexing like most programming languages.

---

# Best Practices

Good

```
server-${count.index}
```

Avoid

```
server
```

for multiple resources.

Always make resource names unique.

---

# 6. Conditional Expressions

## What is a Conditional Expression?

Conditional Expressions allow Terraform to choose between two values based on a condition.

Syntax from the course:

```text
condition ? true_value : false_value
```

:contentReference[oaicite:2]{index=2}

---

# Example

```hcl
instance_type = var.environment == "prod"
? "m5.large"
: "t2.micro"
```

Meaning

If

```
Environment = prod
```

↓

```
m5.large
```

Otherwise

```
t2.micro
```

---

# Real AWS Example

Development

```
Small EC2
```

Production

```
Large EC2
```

Instead of maintaining two separate Terraform files, one conditional expression handles both cases.

---

# Best Practices

✔ Keep conditions simple.

✔ Avoid deeply nested conditions.

✔ Use descriptive variable names.

---

# Common Mistakes

❌

Making very long conditional expressions.

Instead

Break complex logic into smaller variables for readability.

---

# Interview Question

Why use Conditional Expressions?

Answer

To make Terraform configurations flexible by selecting values dynamically without duplicating code.

---

# 7. Terraform Functions

Terraform includes many built-in helper functions.

Functions reduce repetitive work and simplify expressions.

The Day 06 lessons introduce the concepts using examples such as `max()` and `file()`, and recommend experimenting with them in `terraform console`. :contentReference[oaicite:3]{index=3}

---

# Example 1 — max()

```hcl
max(10,25,15)
```

Output

```
25
```

---

# Example 2 — file()

```hcl
file("userdata.sh")
```

Reads the contents of the file and returns it as a string.

Common AWS use case:

Passing EC2 User Data scripts.

---

# Terraform Console

Terraform Console allows you to test expressions before using them.

Command

```bash
terraform console
```

Examples

```text
> max(10,20,5)

20
```

```text
> upper("terraform")

"TERRAFORM"
```

```text
> lower("AWS")

"aws"
```

This is one of the safest ways to experiment without running `terraform apply`.

---

# Production Best Practices

✔ Define explicit variable types.

✔ Use Lists for ordered collections.

✔ Use Maps for configuration values and tags.

✔ Use Count only for nearly identical resources.

✔ Make every generated resource name unique.

✔ Test expressions with Terraform Console.

✔ Keep conditional expressions readable.

---

# Common Errors

| Error | Cause | Solution |
|---------|--------|----------|
| Invalid index | Index does not exist | Verify List length |
| Invalid function argument | Wrong argument type | Read function documentation |
| Duplicate resource name | Missing count.index | Generate unique names |
| Invalid value for count | Count is not numeric | Use a Number |

---

# Terraform Associate Notes

Know:

- Core Data Types
- Difference between List and Map
- Count Meta-Argument
- count.index
- Conditional Expressions syntax
- Built-in Functions
- Terraform Console purpose

Exam Trap

Many candidates confuse:

List

```
var.names[0]
```

with

Map

```
var.names["dev"]
```

Remember:

**List → Index**

**Map → Key**

---

# Interview Cheat Sheet

## Beginner

**Q:** What is a Terraform Data Type?

**A:** It defines the kind of value a variable can store.

---

**Q:** What is a List?

**A:** An ordered collection of values accessed by index.

---

**Q:** What is a Map?

**A:** A collection of key-value pairs accessed by key.

---

**Q:** Why use Count?

**A:** To create multiple similar resources using one resource block.

---

**Q:** What is count.index?

**A:** A zero-based index assigned to each resource created by Count.

---

**Q:** Why use Conditional Expressions?

**A:** To choose between values dynamically based on a condition.

---

**Q:** Why use Terraform Console?

**A:** To safely test expressions and functions without modifying infrastructure.

---

# Key Takeaways

- Data Types improve validation and readability.
- Lists store ordered values.
- Maps store named key-value pairs.
- Count creates multiple similar resources.
- count.index uniquely identifies each created resource.
- Conditional Expressions make configurations dynamic.
- Functions reduce repetitive work.
- Terraform Console is the safest place to experiment with expressions.

---

# Revision Checklist

- [ ] I understand every Terraform Data Type covered today.
- [ ] I can explain the difference between List and Map.
- [ ] I can access List values using indexes.
- [ ] I can access Map values using keys.
- [ ] I can use Count to create multiple resources.
- [ ] I know why count.index starts from zero.
- [ ] I can write Conditional Expressions.
- [ ] I know when to use Terraform Console.
- [ ] I solved the Functions Challenge before checking the instructor's solution.