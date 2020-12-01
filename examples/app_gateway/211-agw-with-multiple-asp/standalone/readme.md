You can test this module outside of a landingzone using

```bash
cd /tf/caf/aztfmod/examples/app_gateway/211-agw-with-multiple-asp/standalone

terraform init

terraform plan \
  -var-file ../application_gateways.tfvars  \
  -var-file ../application.tfvars \
  -var-file ../certificates.tfvars \
  -var-file ../configuration.tfvars \
  -var-file ../keyvaults.tfvars \
  -var-file ../nsg_definition.tfvars  \
  -var-file ../public_ip_addresses.tfvars \
  -var-file ../virtual_network.tfvars \
  -var-file ../managed_identities.tfvars \
  -var-file ../app_services.tfvars

```