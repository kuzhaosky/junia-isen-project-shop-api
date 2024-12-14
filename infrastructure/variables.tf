variable "db_server_name" {
  description = "The name of the PostgreSQL server"
  default     = "myflaskdbserver"
}

variable "db_name" {
  description = "The name of the PostgreSQL database"
  default     = "myshopdb"
}

variable "db_admin_user" {
  description = "The admin username for the PostgreSQL server"
  default     = "flaskadmin"
}

variable "db_admin_password" {
  description = "The admin password for the PostgreSQL server"
  default     = "Happytomelxy123"
}

variable "location" {
  description = "The location for the Azure resources"
  default     = "France Central"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "MyResourceGroup"
}
