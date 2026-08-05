resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4 = "${aws_eip.eip1.public_ip}/32"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
}
