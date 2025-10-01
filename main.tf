resource "azurerm_resource_group" "hlc3" {
  name     = "hlc-rg"
  location = "centralindia"
}
resource "azurerm_storage_account" "hcl3stg" {
  depends_on               = [azurerm_resource_group.hlc3]
  name                     = "hclstorage31"
  resource_group_name      = "hlc-rg3"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "hcl3container" {
  name                  = "chomu"
   depends_on               = [azurerm_storage_account.hcl3stg]
  
  storage_account_id  =  "hclstorage31"
  container_access_type = "private"
}