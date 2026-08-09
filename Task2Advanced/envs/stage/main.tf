module "vms" {
  source         = "../../modules/vm"
  environment    = var.environment
  project_name   = var.project_name
  created_by     = var.created_by
  resource_count = var.resource_count

  tags = {
    environment = var.environment
    deployed_by = var.created_by
  }
}