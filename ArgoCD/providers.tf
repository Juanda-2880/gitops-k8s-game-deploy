provider "azurerm" {
  features {}
}

provider "kubernetes" {
    config_path = "~/.kube/config"
}