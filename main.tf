
resource null_resource print_names {
  provisioner "local-exec" {
    command = "echo 'Resource group: ${var.resource_group_name}'"
  }
}

data "ibm_resource_group" "resource_group" {
  depends_on = [null_resource.print_names]

  name = var.resource_group_name
}

locals {
  role        = "Manager"
  name_prefix = var.name_prefix != "" ? var.name_prefix : var.resource_group_name
  name        = var.name != "" ? var.name : "${replace(local.name_prefix, "/[^a-zA-Z0-9_\\-\\.]/", "")}-${var.label}"
  key_name    = "${local.name}-key"
  module_path = substr(path.module, 0, 1) == "/" ? path.module : "./${path.module}"
  tags        = setsubtract(var.tags, [""])
  service     = "messagehub"
  isEnterprise = var.plan == "enterprise"
  service_endpoints = {
    service-endpoints = var.private_endpoints ? "private" : "public-and-private"
  }
  private_ip_allowlist = var.private_ip_allowlist != null ? { private_ip_allowlist: var.private_ip_allowlist } : {}
  throughput = var.throughput != null ? { throughput = var.throughput } : {}
  storage_size = var.storage_size != null ? { storage_size = var.storage_size } : {}
  parameters   = local.isEnterprise ? merge(local.service_endpoints, local.private_ip_allowlist, local.throughput, local.storage_size) : {}
}

resource ibm_resource_instance instance {
  count             = var.provision ? 1 : 0

  name              = local.name
  service           = local.service
  plan              = var.plan
  location          = var.region
  resource_group_id = data.ibm_resource_group.resource_group.id
  tags              = local.tags
  parameters        = local.parameters

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

data ibm_resource_instance instance {
  depends_on        = [ibm_resource_instance.instance]

  name              = local.name
  service           = local.service
  location          = var.region
  resource_group_id = data.ibm_resource_group.resource_group.id
}

resource ibm_resource_key credentials {

  name                 = local.key_name
  resource_instance_id = data.ibm_resource_instance.instance.id
  role                 = local.role

  timeouts {
    create = "15m"
    delete = "15m"
  }
}
