variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "cpu_cores" {
  description = "Количество ядер CPU (1-64)"
  type        = number

  validation {
    condition     = var.cpu_cores >= 1 && var.cpu_cores <= 64
    error_message = "Количество ядер должно быть от 1 до 64"
  }
}

variable "ram_mb" {
  description = "Объём RAM в МБ (512-524288)"
  type        = number

  validation {
    condition     = var.ram_mb >= 512 && var.ram_mb <= 524288
    error_message = "RAM должна быть от 512 МБ до 512 ГБ"
  }
}

variable "disk_size_gb" {
  description = "Размер диска в ГБ (10-4096)"
  type        = number

  validation {
    condition     = var.disk_size_gb >= 10 && var.disk_size_gb <= 4096
    error_message = "Размер диска должен быть от 10 ГБ до 4 ТБ"
  }
}

variable "subnet_id" {
  description = "Идентификатор подсети"
  type        = string
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ"
  type        = string
  sensitive   = true
}

variable "disk_type" {
  description = "Тип диска"
  type        = string
  default     = "network-ssd"
}

variable "image_id" {
  description = "ID образа ОС"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "environment" {
  description = "Окружение"
  type        = string
  default     = "dev"
}

variable "labels" {
  description = "Метки"
  type        = map(string)
  default     = {}
}