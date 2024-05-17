provider "azurerm" {
  features {}
    subscription_id = 05cc9ded-341d-4fc8-86e2-374d537c5579
    client_id       = 78ff5737-aea9-4d81-82b9-d08eb575b2ca
    client_secret   = FGx8Q~UnjFx_CpK0wBkueqEwqg3gT6_dAERSNa63
    tenant_id       = bfcf1d9d-93ea-43b1-b902-1daa68a64248
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}


resource "azurerm_service_plan" "service_plan" {
  name                = "webapp-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "example" {
  name                = "aminescoffeshop"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {
    always_on = true
    application_stack {
      docker_image_name = var.container_image
      docker_registry_url = "https://index.docker.io"
    }
  }
}
