rgs = {
  rg01 = {
    name     = "rg-studio-preprod-01"
    location = "Southeast Asia"
  }

}
dns-zones = {
  zone01 = {
    name                = "aulakhcreative.online"
    resource_group_name = "rg-studio-preprod-01"
  }
}
dnsrecords = {
  record01 = {
    name                = "test"
    zone_name           = "aulakhcreative.online"
    resource_group_name = "rg-studio-preprod-01"
    ttl                 = 300
    records             = ["10.0.180.17"]
  }
}
vnets = {
  vnet01 = {
    name                = "vnet-studio-preprod-01"
    location            = "Southeast Asia"
    resource_group_name = "rg-studio-preprod-01"
    address_space       = ["10.0.0.0/16"]

    tags = {
      Environment = "Preprod"
      Project     = "DNS-Mapping"
      ManagedBy   = "Terraform"
      Owner       = "DevOps"
    }
  }
}

subnets = {
  linux = {
    name                 = "snet-studio-linux-01"
    resource_group_name  = "rg-studio-preprod-01"
    virtual_network_name = "vnet-studio-preprod-01"
    address_prefixes     = ["10.0.1.0/24"]
  }

  windows = {
    name                 = "snet-studio-windows-01"
    resource_group_name  = "rg-studio-preprod-01"
    virtual_network_name = "vnet-studio-preprod-01"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

nsgs = {
  nsg01 = {
    name                = "nsg-studio-linux-01"
    location            = "Southeast Asia"
    resource_group_name = "rg-studio-preprod-01"
  }
  nsg02 = {
    name                = "nsg-studio-windows-01"
    location            = "Southeast Asia"
    resource_group_name = "rg-studio-preprod-01"
  }
}

nsg-asso = {
  linux = {
    nic_name            = "nic-studio-linux-01"
    nsg_name            = "nsg-studio-linux-01"
    resource_group_name = "rg-studio-preprod-01"
  }

  windows = {
    nic_name            = "nic-studio-windows-01"
    nsg_name            = "nsg-studio-windows-01"
    resource_group_name = "rg-studio-preprod-01"
  }
}
nics = {
  linux = {
    name                = "nic-studio-linux-01"
    location            = "Southeast Asia"
    resource_group_name = "rg-studio-preprod-01"
    subnet_name          = "snet-studio-linux-01"
    virtual_network_name = "vnet-studio-preprod-01"

  }
  windows = {
    name     = "nic-studio-windows-01"
    location = "Southeast Asia"
  resource_group_name = "rg-studio-preprod-01" 
  
    subnet_name          = "snet-studio-windows-01"
    virtual_network_name = "vnet-studio-preprod-01"
  }
  }
