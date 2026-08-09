cloud_id       = "b1gxxxxxxxxxxxxxx"
folder_id      = "b1gxxxxxxxxxxxxxx"
zone           = "ru-central1-c"
environment    = "prod"
subnet_id      = "e9bxxxxxxxxxxxx"
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2E..."

vm_configs = {
  web-1 = {
    vm_name      = "prod-web-01"
    cpu_cores    = 8
    ram_mb       = 16384
    disk_size_gb = 100
  }
  web-2 = {
    vm_name      = "prod-web-02"
    cpu_cores    = 8
    ram_mb       = 16384
    disk_size_gb = 100
  }
  app-1 = {
    vm_name      = "prod-app-01"
    cpu_cores    = 16
    ram_mb       = 65536
    disk_size_gb = 150
  }
  app-2 = {
    vm_name      = "prod-app-02"
    cpu_cores    = 16
    ram_mb       = 65536
    disk_size_gb = 150
  }
  db-primary = {
    vm_name      = "prod-db-01"
    cpu_cores    = 32
    ram_mb       = 131072
    disk_size_gb = 500
  }
  db-replica = {
    vm_name      = "prod-db-02"
    cpu_cores    = 16
    ram_mb       = 65536
    disk_size_gb = 500
  }
}