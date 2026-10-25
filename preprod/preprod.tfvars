rgs = {
  rg01 = {
    name     = "rg-lms-idn-preprod-01"
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
    resource_group_name = "rg-lms-idn-preprod-01"
    ttl                 = 300
    records             = ["10.0.180.17"]
  }
}