
rgs = {
  rg01 = {
    name     = "rg-studio-preprod-01"
    location = "japaneast"
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
    location            = "japaneast"
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
  linux = {
    name                = "nsg-studio-linux-01"
    location            = "japaneast"
    resource_group_name = "rg-studio-preprod-01"

    security_rules = {
      ssh = {
        name                   = "Allow-SSH"
        priority               = 100
        destination_port_range = "22"
        source_address_prefix  = "YOUR_PUBLIC_IP/32"
      }

      http = {
        name                   = "Allow-HTTP"
        priority               = 110
        destination_port_range = "80"
        source_address_prefix  = "*"
      }
    }
  }

  windows = {
    name                = "nsg-studio-windows-01"
    location            = "japaneast"
    resource_group_name = "rg-studio-preprod-01"

    security_rules = {
      http = {
        name                   = "Allow-HTTP"
        priority               = 100
        destination_port_range = "80"
        source_address_prefix  = "*"
      }

      rdp = {
        name                   = "Allow-RDP"
        priority               = 110
        destination_port_range = "3389"
        source_address_prefix  = "YOUR_PUBLIC_IP/32"
      }
    }
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
    name                 = "nic-studio-linux-01"
    location             = "japaneast"
    resource_group_name  = "rg-studio-preprod-01"
    subnet_name          = "snet-studio-linux-01"
    virtual_network_name = "vnet-studio-preprod-01"
    public_ip_name       = "pip-studio-preprod-01"
  }

  win1 = {
    name                 = "nic-studio-win-preprod-01"
    location             = "japaneast"
    resource_group_name  = "rg-studio-preprod-01"
    subnet_name          = "snet-studio-windows-01"
    virtual_network_name = "vnet-studio-preprod-01"
    public_ip_name       = "pip-studio-windows-01"
  }

  win2 = {
    name                 = "nic-studio-win-preprod-02"
    location             = "japaneast"
    resource_group_name  = "rg-studio-preprod-01"
    subnet_name          = "snet-studio-windows-01"
    virtual_network_name = "vnet-studio-preprod-01"
    public_ip_name       = "pip-studio-windows-01"
  }
}
pips = {
  pip01 = {
    name                = "pip-studio-preprod-01"
    resource_group_name = "rg-studio-preprod-01"
    location            = "japaneast"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip02 = {
    name                = "pip-studio-windows-01"
    resource_group_name = "rg-studio-preprod-01"
    location            = "japaneast"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

vms-linux = {
  linux = {
    name                = "vm-studio-linux-01"
    resource_group_name = "rg-studio-preprod-01"
    location            = "japaneast"
    size                = "Standard_D2s_v5"
    admin_username      = "azureadmin"
    admin_password      = "H@llo123456789"
    nic_name            = "nic-studio-linux-01"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    tags = {
      Environment = "Preprod"
      ManagedBy   = "Terraform"
      Project     = "Studio"
      Owner       = "DevOps"
    }
  }
}
vms-win = {
  vm1 = {
    name                = "vm-studio-win-preprod-01"
    location            = "japaneast"
    resource_group_name = "rg-studio-preprod-01"
    size                = "Standard_D2s_v5"
    admin_username      = "azureadmin"
    nic_name            = "nic-studio-win-preprod-01"
  }

  vm2 = {
    name                = "vm-studio-win-preprod-02"
    location            = "japaneast"
    resource_group_name = "rg-studio-preprod-01"
    size                = "Standard_D2s_v5"
    admin_username      = "azureadmin"
    nic_name            = "nic-studio-win-preprod-02"
  }
}
  # nats = {
  #   linux = {
  #     name                    = "nat-studio-linux-preprod-01"
  #     location                = "japaneast"
  #     resource_group_name     = "rg-studio-preprod-01"
  #     sku_name                = "Standard"
  #     idle_timeout_in_minutes = 10
  #     zones                   = ["1"]
  #   }

  #   windows = {
  #     name                    = "nat-studio-windows-preprod-01"
  #     location                = "japaneast"
  #     resource_group_name     = "rg-studio-preprod-01"
  #     sku_name                = "Standard"
  #     idle_timeout_in_minutes = 10
  #     zones                   = ["1"]
  #   }
  # }


  