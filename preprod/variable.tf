variable "rgs" {}
variable "dns-zones" {}
variable "dnsrecords" {}
variable "vnets" {}
variable "subnets" {}
variable "nics" {}
variable "nsgs" {}
variable "nsg-asso" {}
variable "pips" {}
variable "vms" {}
variable "admin_password" {
  type      = string
    description = "Administrator password for Linux VM"

  sensitive = true
}
variable "vms-win"{}

variable "admin_password" {
  description = "Administrator password for Windows VM"
  type        = string
  sensitive   = true
}