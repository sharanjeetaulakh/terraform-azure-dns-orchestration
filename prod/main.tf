module "rgs" {
  source = "git::https://github.com/sharanjeetaulakh/terraform-azure-resource-group.git"
  rgs    = var.rgs
}
module "dnszone"{
  source="git::https://github.com/sharanjeetaulakh/terraform-azure-dns-zone.git"
  dnszones=var.dnszones
}
module "dnsrecord"{
  source="https://github.com/sharanjeetaulakh/terraform-azure-dns-a-record.git"
  dnsrecords=var.dnsrecords
}