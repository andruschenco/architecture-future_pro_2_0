variable "cloud_id" {
  description = "ID облака"
  type        = string
}

variable "folder_id" {
  description = "ID каталога"
  type        = string
}

variable "zone" {
  description = "Зона доступности"
  type        = string
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Окружение"
  type        = string
}

variable "vm_configs" {
  description = "Конфигурации ВМ"
  type = map(object({
    vm_name      = string
    cpu_cores    = number
    ram_mb       = number
    disk_size_gb = number
    disk_type    = optional(string, "network-ssd")
    image_id     = optional(string, "ubuntu-2204-lts")
    zone         = optional(string, "ru-central1-a")
  }))
}