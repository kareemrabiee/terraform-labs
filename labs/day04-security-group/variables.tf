variable "vpn-ip" {
    default = "167.22.45.11/32"
    description = "The IP address of the VPN client that is allowed to access the server"
}

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