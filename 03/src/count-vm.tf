resource "yandex_compute_instance" "web" {
  count = var.web_vm_count

  name = "web-${count.index + 1}"

  resources {
    cores  = var.count_vm_cores
    memory = var.count_vm_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.web_vm_image_id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.vm_nat
    security_group_ids = [var.security_group_id]
  }

  metadata = {
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  depends_on = [yandex_vpc_network.develop, yandex_vpc_subnet.develop]
}