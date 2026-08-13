cloud_id       = "b1gxxxxxxxxxxxxxx"
folder_id      = "b1gxxxxxxxxxxxxxx"
zone           = "ru-central1-a"
environment    = "dev"
subnet_id      = "e9bxxxxxxxxxxxx"
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2E..."

vm_configs = {
  web = {
    vm_name      = "dev-web-01"
    cpu_cores    = 2
    ram_mb       = 2048
    disk_size_gb = 30
    disk_type    = "network-hdd"
  }
  app = {
    vm_name      = "dev-app-01"
    cpu_cores    = 4
    ram_mb       = 8192
    disk_size_gb = 60
  }
}