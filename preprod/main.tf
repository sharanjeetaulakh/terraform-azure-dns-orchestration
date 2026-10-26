module "rgs" {
  source = "git::https://github.com/sharanjeetaulakh/terraform-azure-resource-group.git"
  rgs    = var.rgs
}
module "dnszone" {
  depends_on = [module.rgs]
  source     = "git::https://github.com/sharanjeetaulakh/terraform-azure-dns-zone.git"
  dns-zones  = var.dns-zones
}
module "dnsrecord" {
  depends_on = [module.rgs, module.dnszone]
  source     = "git::https://github.com/sharanjeetaulakh/terraform-azure-dns-a-record.git"
  dnsrecords = var.dnsrecords
}
module "dnsvnet" {
  depends_on = [module.rgs]
  source     = "git::https://github.com/sharanjeetaulakh/terraform-azure-vnet.git"
  vnets      = var.vnets
}
module "dns-subnet" {
  depends_on = [module.rgs]
  source     = "git::https://github.com/sharanjeetaulakh/terraform-azure-subnet.git"
  subnets    = var.subnets
}
module "nsg" {
  depends_on = [module.rgs]
  source     = "https://github.com/sharanjeetaulakh/terraform-azure-nsg.git"
 nsgs   = var.nsgs
}



# module "nic" {
#   depends_on = [module.rgs]
#   source     = "git::https://github.com/sharanjeetaulakh/azurerm-network-interface.git"
#   nics       = var.nics
# }