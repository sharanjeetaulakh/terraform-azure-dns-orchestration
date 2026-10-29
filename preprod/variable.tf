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
  sensitive = true
}
variable "nms1"{}