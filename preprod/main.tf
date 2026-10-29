
module "rgs" {
  source = "git::https://github.com/sharanjeetaulakh/terraform-azure-resource-group.git"
  rgs    = var.rgs
}

module "dnszone" {
  depends_on = [module.rgs]

  source    = "git::https://github.com/sharanjeetaulakh/terraform-azure-dns-zone.git"
  dns-zones = var.dns-zones
}

module "dnsrecord" {
  depends_on = [module.rgs, module.dnszone]

  source     = "git::https://github.com/sharanjeetaulakh/terraform-azure-dns-a-record.git"
  dnsrecords = var.dnsrecords
}

module "vnet" {
  depends_on = [module.rgs]

  source = "git::https://github.com/sharanjeetaulakh/terraform-azure-vnet.git"
  vnets  = var.vnets
}

module "subnet" {
  depends_on = [module.vnet, module.rgs]

  source  = "git::https://github.com/sharanjeetaulakh/terraform-azure-subnet.git"
  subnets = var.subnets
}

module "network_secuity" {
  depends_on = [module.rgs]

  source = "git::https://github.com/sharanjeetaulakh/terraform-azure-nsg.git"
  nsgs   = var.nsgs
}

module "public-ip" {
  depends_on = [module.rgs]

  source = "git::https://github.com/sharanjeetaulakh/terraform-azure-public-ip.git"
  pips   = var.pips
}

module "nic" {
  depends_on = [module.subnet, module.public-ip]

  source = "git::https://github.com/sharanjeetaulakh/azurerm-network-interface.git"

  nics          = var.nics
}

module "network_secuity-asso" {
  depends_on = [module.nic, module.network_secuity]

  source   = "git::https://github.com/sharanjeetaulakh/terraform-azure-nsg-association.git"
  nsg-asso = var.nsg-asso
}

module "linux_vm" {
  depends_on = [module.nic]

  source = "git::https://github.com/sharanjeetaulakh/terraform-azure-linux-vm"

  vms            = var.vms
    admin_password = var.admin_password
}

module "win_vm" {
  depends_on = [module.nic]
  source = "git::https://github.com/sharanjeetaulakh/terraform-azure-windows.git"
  vms-win= var.vms-win
    admin_password = var.admin_password
}

