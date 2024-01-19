resource "yandex_compute_disk" "default" {
  count = 3
  name     = "${var.vm_and_disk.task_3.disk_name}-${count.index + 1}"
  type     = var.vm_and_disk.task_3.disk_type
  zone     = var.vm_and_disk.task_3.disk_zone
  image_id = var.vm_and_disk.task_3.disk_image_id
}

