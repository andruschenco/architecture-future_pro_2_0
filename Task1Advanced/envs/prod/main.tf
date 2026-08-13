module "vms" {
  source   = "../../modules/vm"
  for_each = var.vm_configs

  vm_name      = each.value.vm_name
  cpu_cores    = each.value.cpu_cores
  ram_mb       = each.value.ram_mb
  disk_size_gb = each.value.disk_size_gb
  disk_type    = each.value.disk_type
  image_id     = each.value.image_id
  zone         = each.value.zone
  subnet_id    = var.subnet_id
  ssh_public_key = var.ssh_public_key
  environment  = var.environment
}