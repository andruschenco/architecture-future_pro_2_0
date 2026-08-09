terraform {
  required_version = ">= 1.3.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.100"
    }
  }
}

locals {
  default_labels = {
    managed_by  = "terraform"
    environment = var.environment
  }
  merged_labels = merge(local.default_labels, var.labels)
}

resource "yandex_compute_disk" "boot_disk" {
  name     = "${var.vm_name}-boot-disk"
  type     = var.disk_type
  zone     = var.zone
  size     = var.disk_size_gb
  image_id = var.image_id
  labels   = local.merged_labels
}

resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = var.cpu_cores <= 4 ? "standard-v2" : "standard-v3"
  zone        = var.zone

  resources {
    cores  = var.cpu_cores
    memory = var.ram_mb
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }

  labels = local.merged_labels
}