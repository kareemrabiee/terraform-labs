resource "aws_eip" "eip1" {
  instance = aws_instance.k1.id
  domain = "vpc"
}