
resource "yandex_compute_instance" "db" {
  for_each = { for vm in var.db_vm_config : vm.vm_name => vm }

  name = each.value.vm_name

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      image_id   = var.web_vm_image_id
      size       = each.value.disk_volume
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = var.each_vm_nat
    security_group_ids = [var.security_group_id]
  }

  metadata = {
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }

  scheduling_policy {
    preemptible = var.each_vm_preemptible
  }

  depends_on = [yandex_vpc_network.develop, yandex_vpc_subnet.develop]
}