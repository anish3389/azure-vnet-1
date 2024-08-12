variable "resource_group_name" {
  description = "Name of resource group where resources are created"
  type = string
}

variable "dev_prefix" {
    description = "Prefix for resources in dev environment"
    type = string
    default = "anish-rg-dev-"
}

variable "prod_prefix" {
    description = "Prefix for resources in prod environment"
    type = string
    default = "anish-rg-prod-"
}

variable "default_tags" {
  type = map(string)
  default = {
    owner     = "anish.sapkota"
    terraform = "true"
    project   = "azure-learn"
  }
}
