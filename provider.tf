terraform {

  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
  backend "azurerm" {
    # resource_group_name  = "RG_TOOLS_DEVOPS_PRD_EUS2"
    resource_group_name  = "RG_LABDEVOPS"
    storage_account_name = "labsdevops"
    # storage_account_name = "terraformdevopsraizen"
    container_name       = "tf-lab-devops"
    # container_name       = "tf-ricardo"
    key                  = "tf-lab-devops-dirlei-terraform.state"
    subscription_id      = "b1ca0227-2e4b-48e1-82e4-0ba99fdb2d8f"
  }
}

provider "azurerm" {
  # alias                  = "Arquitetura-DEV"
  subscription_id = lower("b1ca0227-2e4b-48e1-82e4-0ba99fdb2d8f")
  features {}
}

#SUB_CSC_DEV_EUS2 - e5bac7fc-29ed-460f-aa15-8c3c34807eac
#SUB_CSC_QAS_EUS2 - ccea0a91-3508-44e3-9899-c12c199d07ea
#SUB_CSC_PRD_EUS2 - 30eea359-9a4b-48c7-8def-3f1577554456
#SUB_LDT_DEV_EUS2 - caedadc8-9918-415f-a0dd-e3dc4b205386
#SUB_LDT_QAS_EUS2 - db39f1f9-2eb1-46aa-b007-07efcd374c60
#SUB_LDT_PRD_EUS2 - 40f9f0a1-6c4d-42fa-8fb9-edd56e4f5ec1
#SUB_EAB_DEV_EUS2 - 929bd3e0-ea17-4c77-83ef-9134c978006e
#SUB_EAB_QAS_EUS2 - 1b287dad-454b-482a-8301-835177cb07fd
#SUB_EAB_PRD_EUS2 - 98333864-584e-4bb7-9055-6f9809d5af50
#SUB_FIN_DEV_EUS2 - 6f837d20-4885-4d30-a2f6-8b434b2cd3d4
#SUB_FIN_QAS_EUS2 - 42b22328-a428-4dea-b459-5152d197dd57
#SUB_FIN_PRD_EUS2 - 8e5ba4fd-0f2c-49d9-93da-d1f655cee8e9