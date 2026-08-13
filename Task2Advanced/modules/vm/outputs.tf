output "vm_ids" {
  value = [for i in range(var.resource_count) : format("%08d", i + 1)]
}

output "disk_ids" {
  value = [for i in range(var.resource_count) : format("%012d", i + 1)]
}

output "total_vms" {
  value = var.resource_count
}