variable "vpn-ip" {}

variable "https-port" {
    default = 443
    description = "The port number for the HTTPS connection"
}

variable "http-port" {
    default = 80
    description = "The port number for the HTTP connection"
}

variable "ssh-port" {
    default = 22
    description = "The port number for the SSH connection"
  
}

variable "ftp-port" {
    default = 21
    description = "The port number for the FTP connection"
  
}

variable "instance_type" {
    default = "t3.micro"
}

