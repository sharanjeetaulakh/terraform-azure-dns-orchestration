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