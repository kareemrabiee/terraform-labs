resource "aws_instance" "k1" {
  ami           = "ami-02b64aa047cb5edf5"
  instance_type = var.instance_type
  subnet_id   = "subnet-0be8e2e22a0bac3b0"

  tags = {
    Name = "instance1"
  }
}


