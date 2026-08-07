variable "list_data_types" {
  description = "A list of data types to be used in the lab."
  type        = list(string)
  default     = ["string", "number", "bool", "list", "map"]
}

output "list_data_types_output-first-element" {
  description = "The list of data types defined in the variable."
  value       = var.list_data_types[0]
}

output "all_list_data_types_output" {
  description = "The list of data types defined in the variable."
  value       = var.list_data_types
}


variable "input_list_of_numbers_only" {
  description = "A list of numbers to be used in the lab."
  type        = list(number)
}


output "number_writed" {
  description = "The list of numbers defined in the variable."
  value       = var.input_list_of_numbers_only
  }


  
variable "enter-names" {
  description = "A list of names to be used in the lab."
  type        = list(string)
}

output "iam_user_added" {
  description = "The list of iam user added "
  value       = var.enter-names
}

  #------------------

resource aws_instance myec2 {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.types["us-east-2"]
}

resource aws_instance example {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.list[0]
}

variable "list" {
  type = list(string)
  default = ["t3.small", "t3.medium", "t3.large"]
}

variable "types" {
    type = map(string)
    default = {
        us-east-1 = "t3.small"
        us-east-2 = "t3.medium"
        us-west-1 = "t3.large"
    }
}

#------------------
resource aws_instance example {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.small"
  count         = 3
  tags = {
    name="kareem-${count.index}"
  }
}

variable "list_of_names" {
  description = "A list of names to be used in the lab."
  type        = list(string)
  default     = ["kareem", "ahmed", "mohamed"]
}

resource aws_iam_user example {
  name = var.list_of_names[count.index]
  count = 3
}

  
#------------------

variable "environment" {
    default = "dev"
}

variable "region" {
    default = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.environment == "dev" || var.region == "us-east-1" ? "t3.small" : "t3.medium"

  }
 