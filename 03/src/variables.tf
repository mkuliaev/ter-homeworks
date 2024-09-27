variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC name"
}


variable "each_vm" {
  type = list(object({
    name   = string
    image  = string
    flavor = string
  }))
}


variable "web_vm_count" {
  type        = number
  default     = 2
  description = "web_vm_count"
}

variable "web_vm_image_id" {
  type        = string
  default     = "fd8i352834u7dsm7rfbv"
  description = "Iweb_vm_image_id"
}

variable "db_vm_config" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  default = [
    { vm_name = "main", cpu = 4, ram = 8, disk_volume = 50 },
    { vm_name = "replica", cpu = 2, ram = 4, disk_volume = 20 }
  ]
  description = "db_vm_config"
}

variable "storage_disk_count" {
  type        = number
  default     = 3
  description = "storage_disk_cou"
}

variable "storage_disk_size" {
  type        = number
  default     = 1
  description = "Size disk "
}

variable "storage_disk_type" {
  type        = string
  default     = "network-hdd"
  description = "network-hdd, network-ssd"
}


variable "storage_vm_image_id" {
  type        = string
  default     = "fd8i352834u7dsm7rfbv"
  description = "Image ID "
}

variable "storage_vm_name" {
  type        = string
  default     = "storage"
  description = "Name VM"
}

variable "storage_vm_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID "
}

variable "storage_vm_cores" {
  type        = number
  default     = 2
  description = " cores VM"
}

variable "storage_vm_memory" {
  type        = number
  default     = 4
  description = " memory"
}


variable "count_vm_cores" {
  type        = number
  default     = 2
  description = " cores VM"
}

variable "count_vm_memory" {
  type        = number
  default     = 2
  description = " memory"
}


variable "vm_nat" {
  type        = bool
  default     = true
  description = " NAT "
}

variable "vm_preemptible" {
  type        = bool
  default     = true
  description = "preemptible"
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "security_group"
  type        = string
}

variable "vms_ssh_root_key" {
  type        = string
  description = "SSH "
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID "
}
