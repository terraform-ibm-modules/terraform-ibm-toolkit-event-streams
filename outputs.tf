output "id" {
  description = "The Event Streams instance id"
  value       = data.ibm_resource_instance.instance.id
}

output "name" {
  description = "The Event Streams instance name"
  value       = local.name
  depends_on  = [data.ibm_resource_instance.instance]
}

output "crn" {
  description = "The crn of the Event Streams instance"
  value       = data.ibm_resource_instance.instance.id
}

output "location" {
  description = "The Event Streams instance location"
  value       = var.region
  depends_on  = [data.ibm_resource_instance.instance]
}

output "key_name" {
  description = "The name of the credential provisioned for the Event Streams instance"
  value       = local.key_name
  depends_on  = [ibm_resource_key.credentials]
}

output "key_id" {
  description = "The name of the credential provisioned for the Event Streams instance"
  value       = ibm_resource_key.credentials.id
}

output "service" {
  description = "The name of the key provisioned for the Event Streams instance"
  value       = local.service
  depends_on = [data.ibm_resource_instance.instance]
}

output "label" {
  description = "The label used for the Event Streams instance"
  value       = var.label
  depends_on = [data.ibm_resource_instance.instance]
}
