resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow HTTPS"
  vpc_id      = "vpc-034ac5f4f327b643b"

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4 = var.vpn-ip

  from_port   = var.https-port
  to_port     = var.https-port
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4 = var.vpn-ip

  from_port   = var.ssh-port
  to_port     = var.ssh-port
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "ftp" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4 = var.vpn-ip

  from_port   = var.ftp-port
  to_port     = var.ftp-port
  ip_protocol = "tcp"
}


resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4 = var.vpn-ip

  from_port   = var.http-port
  to_port     = var.http-port
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4 = var.vpn-ip

  ip_protocol = "-1"
}