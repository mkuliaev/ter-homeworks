resource "yandex_compute_disk" "storage_disk" {
  count = var.storage_disk_count

  name  = "storage-disk-${count.index}"
  size  = var.storage_disk_size
  type  = var.storage_disk_type
  zone  = var.default_zone
}

resource "yandex_compute_instance" "storage" {
  name        = var.storage_vm_name
  platform_id = var.storage_vm_platform_id
  zone        = var.default_zone

  resources {
    cores  = var.storage_vm_cores
    memory = var.storage_vm_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.storage_vm_image_id
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = var.storage_vm_nat
    security_group_ids = [var.security_group_id]
  }

  metadata = {
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk

    content {
      disk_id = secondary_disk.value.id
    }
  }
}