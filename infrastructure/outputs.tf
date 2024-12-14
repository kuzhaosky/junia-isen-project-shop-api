output "app_service_url" {
  value = azurerm_app_service.example.default_site_hostname
}

output "db_server_name" {
  value = azurerm_postgresql_server.example.fqdn
}

output "db_admin_user" {
  value = var.db_admin_user
}

output "db_name" {
  value = var.db_name
}
