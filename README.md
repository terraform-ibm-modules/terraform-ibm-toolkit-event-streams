# IBM Event Streams

Module to work with an IBM Cloud Event Streams instance. If the `provision` flag is true then an new instance
of IBM Cloud Event Streams is provisioned. Otherwise, the module will find an existing instance with the
provided name and create a credential. The name and id of the Event Streams instance as well as the name and id
of the credential instance are exported from the module for use by other modules.

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform >= v13

### Terraform providers

- IBM Cloud provider >= 1.18.0

## Module dependencies

This module makes use of the output from other modules:

- Resource group - github.com/cloud-native-toolkit/terraform-ibm-resource-group.git

## Example usage

```hcl-terraform
module "event-streams" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-event-streams.git"

  provision = true
  resource_group_name = module.resource_group.name
  name_prefix = var.name_prefix
  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
}
```

