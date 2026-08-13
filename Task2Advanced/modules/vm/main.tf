resource "terraform_data" "vm" {
  count = var.resource_count

  input = {
    vm_id   = format("%08d", count.index + 1)
    disk_id = format("%012d", count.index + 1)
    environment = var.environment
  }
}