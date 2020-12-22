variable global_settings {}
variable name {}
variable resource_group_name {}
variable location {}
variable sku {
  default = "Basic"
}
variable allocation_method {
  default = "Dynamic"
}
variable ip_version {
  default = "IPv4"
}
variable idle_timeout_in_minutes {
  default = null
}
variable domain_name_label {
  default = null
}
# if set to true, automatically generate a domain name label with the name
variable generate_domain_name_label {
  default = false
}
variable reverse_fqdn {
  default = null
}
variable tags {
  default = null
}
variable zones {
  default = null
}
variable diagnostics {
  default = {}
}
variable diagnostic_profiles {
  default = {}
}
variable base_tags {}