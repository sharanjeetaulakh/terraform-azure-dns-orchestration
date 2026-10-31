
rgs = {
  rg01 = {
    name     = "rg-studio-preprod-01"
    location = "central india"
  }
}

dns-zones = {
  zone01 = {
    name                = "aulakhcreative.online"
    resource_group_name = "rg-studio-preprod-01"
  }
}

dnsrecords = {
  dnsrecords = {
    record01 = {
      name                = "portal"
      zone_name           = "studio.preprod.internal"
      resource_group_name = "rg-studio-preprod-01"
      ttl                 = 300
      records             = ["10.0.1.4"]
    }

    record02 = {
      name                = "workstation01"
      zone_name           = "studio.preprod.internal"
      resource_group_name = "rg-studio-preprod-01"
      ttl                 = 300
      records             = ["10.0.2.4"]
    }
  }

}
private-dns = {
  private-dns-01={
  name                = "studio.preprod.internal"
  resource_group_name = "rg-studio-preprod-01"
}
}

vnets = {
  vnet01 = {
    name                = "vnet-studio-preprod-01"
    location            = "central india"
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
    name                 = "snet-web-preprod-01"
    resource_group_name  = "rg-studio-preprod-01"
    virtual_network_name = "vnet-studio-preprod-01"
    address_prefixes     = ["10.0.1.0/24"]
  }

  windows = {
    name                 = "snet-workstation-preprod-01"
    resource_group_name  = "rg-studio-preprod-01"
    virtual_network_name = "vnet-studio-preprod-01"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

nsgs = {
  linux = {
    name                = "nsg-studio-linux-01"
    location            = "central india"
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
    location            = "central india"
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

  win2 = {
    nic_name            = "nic-studio-win-preprod-02"
    nsg_name            = "nsg-studio-windows-01"
    resource_group_name = "rg-studio-preprod-01"
  }
}

nics = {
  linux = {
    name                 = "nic-studio-linux-01"
    location             = "central india"
    resource_group_name  = "rg-studio-preprod-01"
    subnet_name          = "snet-web-preprod-01"
    virtual_network_name = "vnet-studio-preprod-01"
    public_ip_name       = "pip-studio-preprod-01"
  }

  windows = {
    name                 = "nic-studio-windows-01"
    location             = "central india"
    resource_group_name  = "rg-studio-preprod-01"
    subnet_name          = "snet-workstation-preprod-01"
    virtual_network_name = "vnet-studio-preprod-01"
    public_ip_name       = "pip-studio-windows-01"
  }

  win2 = {
    name                 = "nic-studio-win-preprod-02"
    location             = "central india"
    resource_group_name  = "rg-studio-preprod-01"
    subnet_name          = "snet-workstation-preprod-01"
    virtual_network_name = "vnet-studio-preprod-01"
    public_ip_name       = "pip-studio-windows-02"
  }
}

pips = {
  pip01 = {
    name                = "pip-studio-preprod-01"
    resource_group_name = "rg-studio-preprod-01"
    location            = "central india"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip02 = {
    name                = "pip-studio-windows-01"
    resource_group_name = "rg-studio-preprod-01"
    location            = "central india"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip03 = {
    name                = "pip-studio-windows-02"
    resource_group_name = "rg-studio-preprod-01"
    location            = "central india"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

vms-linux = {
  linux = {

    name                = "vm-web-preprod-01"
    resource_group_name = "rg-studio-preprod-01"
    location            = "central india"
    size                = "Standard_D2s_v5"
  
admin_username                  = "azure-admin"
admin_password                  = "H@llo123456789"
disable_password_authentication = false
    
    
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

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
    name                = "vm-workstation-prep01"
    location            = "central india"
    resource_group_name = "rg-studio-preprod-01"
    size                = "Standard_D2s_v5"
    admin_username      = "azure-admin"


    nic_name = "nic-studio-windows-01"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  vm2 = {
    name                = "vm-studio-pre02"
    location            = "central india"
    resource_group_name = "rg-studio-preprod-01"
    size                = "Standard_B1s"
    admin_username      = "azure-admin"
    nic_name            = "nic-studio-win-preprod-02"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}


nats = {
  linux = {
    name                    = "nat-studio-linux-preprod-01"
    location                = "central india"
    resource_group_name     = "rg-studio-preprod-01"
    sku_name                = "Standard"
    idle_timeout_in_minutes = 10
    zones                   = ["1"]
  }

  windows = {
    name                    = "nat-studio-windows-preprod-01"
    location                = "central india"
    resource_group_name     = "rg-studio-preprod-01"
    sku_name                = "Standard"
    idle_timeout_in_minutes = 10
    zones                   = ["1"]
  }
}
