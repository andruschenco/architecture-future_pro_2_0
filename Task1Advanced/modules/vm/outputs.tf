output "vm_id" {
  description = "Идентификатор виртуальной машины"
  value       = yandex_compute_instance.vm.id
}

output "vm_name" {
  description = "Имя виртуальной машины"
  value       = yandex_compute_instance.vm.name
}

output "vm_internal_ip" {
  description = "Внутренний IP-адрес"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "vm_external_ip" {
  description = "Внешний IP-адрес"
  value       = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}

output "vm_fqdn" {
  description = "FQDN виртуальной машины"
  value       = yandex_compute_instance.vm.fqdn
}

output "disk_id" {
  description = "Идентификатор загрузочного диска"
  value       = yandex_compute_disk.boot_disk.id
}

output "subnet_id" {
  description = "Идентификатор подсети"
  value       = var.subnet_id
}

output "cpu_cores" {
  description = "Количество ядер"
  value       = var.cpu_cores
}

output "ram_mb" {
  description = "Объём RAM"
  value       = var.ram_mb
}