provider "azurerm" {
  features {}
}

# 创建资源组
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# 创建 PostgreSQL 服务器
resource "azurerm_postgresql_server" "example" {
  name                = var.db_server_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  administrator_login          = var.db_admin_user
  administrator_login_password = var.db_admin_password

  sku_name            = "B_Gen5_1"  
  storage_mb          = 5120        
  version             = "16.4"        
  ssl_enforcement_enabled = true    
}

# 创建 PostgreSQL 数据库
resource "azurerm_postgresql_database" "example_db" {
  name                = var.db_name
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name

  charset   = "UTF8"
  collation = "English_United States.1252"
}

# 防火墙规则，允许所有 IP 访问
resource "azurerm_postgresql_firewall_rule" "example" {
  name                = "allow_all_ips"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name

  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}
