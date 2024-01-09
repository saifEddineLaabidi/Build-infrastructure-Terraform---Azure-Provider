variable "agent_count" {
  default = 1
}

variable "dns_prefix" {
  default = "aks-k8s-2024"
}

variable "cluster_name" {
  default = "aks-k8s-2024"
}

variable "acr_name" {
  default = "acrforaks204"
}

variable "sql_name" {
  default = "mssql-2024"
}

variable "db_name" {
  default = "ProductsDB"
}

variable "db_admin_login" {
  default = "saif"
}

variable "db_admin_password" {
  default = "@Aa123456"
}

variable "storage_name" {
  default = "mssqlstorageaccount2024"
}

variable "resource_group_name" {
  default = "aks-k8s-2024"
}

variable "resource_group_location" {
  default = "westeurope"
}