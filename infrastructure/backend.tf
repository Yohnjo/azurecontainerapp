terraform {
  backend "azurerm" {
    storage_account_name = "generalstoragealonsillo"
    container_name = "webappstate"
    key = "stateActions.tfstate"
    
  }
}