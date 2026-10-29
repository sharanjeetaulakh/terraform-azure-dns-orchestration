variable "rgs" {}
variable "dns-zones" {}
variable "dnsrecords" {}
variable "vnets" {}
variable "subnets" {}
variable "nics" {}
variable "nsgs" {}
variable "nsg-asso" {}
variable "pips" {}
variable "vms-linux" {
  type = any
}

variable "vms-win" {
  type = any
}
variable "admin_password_win" {
  description = "Administrator password for Windows virtual machines"
  type        = string
  sensitive   = true
}

variable "admin_password_linux" {
  description = "Administrator password for Linux virtual machines"
  type        = string
  sensitive   = true
}
variable "private-dns" {}