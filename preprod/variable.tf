variable "rgs" {}
variable "dns-zones" {}
variable "dnsrecords" {}
variable "vnets" {}
variable "subnets" {}
variable "nics" {}
variable "nsgs" {}
variable "nsg-asso" {}
variable "vms"{}
variable "admin_password" {
  type      = string
  sensitive = true
}
variable "nats" {}