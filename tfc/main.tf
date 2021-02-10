variable "dev_environment_variables" {
  type = map(string)
}

variable "dev_workspace_id" {
  type = string
}

variable "prod_environment_variables" {
  type = map(string)
}

variable "prod_workspace_id" {
  type = string
}

provider "tfe" {
  hostname = "app.terraform.io"
}

resource "tfe_variable" "dev" {
  for_each = var.dev_environment_variables

  key          = each.key
  value        = each.value
  category     = "terraform"
  workspace_id = var.dev_workspace_id
}

resource "tfe_variable" "prod" {
  for_each = var.prod_environment_variables

  key          = each.key
  value        = each.value
  category     = "terraform"
  workspace_id = var.prod_workspace_id
}