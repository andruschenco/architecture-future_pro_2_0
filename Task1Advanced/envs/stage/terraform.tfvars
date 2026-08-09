cloud_id       = "b1gxxxxxxxxxxxxxx"
folder_id      = "b1gxxxxxxxxxxxxxx"
zone           = "ru-central1-b"
environment    = "stage"
subnet_id      = "e9bxxxxxxxxxxxx"
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2E..."

vm_configs = {
  web-1 = {
    vm_name      = "stage-web-01"
    cpu_cores    = 4
    ram_mb       = 8192
    disk_size_gb = 50
  }
  web-2 = {
    vm_name      = "stage-web-02"
    cpu_cores    = 4
    ram_mb       = 8192
    disk_size_gb = 50
  }
  app-1 = {
    vm_name      = "stage-app-01"
    cpu_cores    = 8
    ram_mb       = 16384
    disk_size_gb = 80
  }
  db-1 = {
    vm_name      = "stage-db-01"
    cpu_cores    = 8
    ram_mb       = 32768
    disk_size_gb = 200
    disk_type    = "network-ssd"
  }
}