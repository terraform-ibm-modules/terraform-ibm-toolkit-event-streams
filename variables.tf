variable "ibmcloud_api_key" {
  type        = string
  description = "The api key for IBM Cloud access"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group where the cluster has been provisioned."
}

variable "region" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = []
}

variable "name_prefix" {
  type        = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
  default     = ""
}

variable "plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite, standard, or enterprise)"
  default     = "standard"
}

variable "provision" {
  type        = bool
  description = "Flag indicating that key-protect instance should be provisioned"
  default     = true
}

variable "name" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = ""
}

variable "label" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = "event-streams"
}

variable "private_endpoints" {
  type        = bool
  description = "Flag indicating that the service should only use private endpoints. (Note: this option is only available for the enterprise plan)"
  default     = true
}

variable "private_ip_allowlist" {
  type        = list(string)
  description = "The list of ip address ranges that are allowed to access the service. (Note: this option is only available for the enterprise plan. See https://cloud.ibm.com/docs/EventStreams?topic=EventStreams-restrict_access for more details)"
  default     = null
}

variable "throughput" {
  type        = string
  description = "For enterprise instance only. Options are: '150', '300', '450'. Default is '150'"
  default     =  null
}

variable "storage_size" {
  type        = string
  description = "for enterprise instance only. Options are: '2048', '4096', '6144', '8192', '10240', '12288'. Default is '2048'."
  default     = null
}
