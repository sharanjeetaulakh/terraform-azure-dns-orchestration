rgs = {
  rg01 = {
    name     = "rg-studio-preprod-01"
    location = "Southeast Asia"
  }
}
dns-zones = {
  zone01 = {
    name                = "aulakhcreative.online"
    resource_group_name = "rg-lms-idn-preprod-01"
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
      Project     = "LoanManagement"
      ManagedBy   = "Terraform"
      Owner       = "DevOps"
    }
  }
}

  subnets = {
    frontend = {
      name                 = "snet-studio-web-01"
      resource_group_name  = "rg-studio-preprod-01"
      virtual_network_name = "vnet-studio-preprod-01"
      address_prefixes     = ["10.0.1.0/24"]
    }

    backend = {
      name                 = "snet-studio-web-02"
      resource_group_name  = "rg-studio-preprod-01"
      virtual_network_name = "vnet-studio-preprod-01"
      address_prefixes     = ["10.0.2.0/24"]
    }

  }
