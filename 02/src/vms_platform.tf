# vms_platform.tf
variable "vm_web_kuliaev_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name of the VM "
}

variable "vm_web_kuliaev_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID "
}

#variable "vm_web_kuliaev_cores" {
#  type        = number
#  default     = 2
#  description = "Number of CPU cores "
#}

#variable "vm_web_kuliaev_memory" {
#  type        = number
#  default     = 1
#  description = " memory "
#}

#variable "vm_web_kuliaev_core_fraction" {
#  type        = number
#  default     = 50
#  description = "Core fraction "
#}

variable "vm_web_kuliaev_preemptible" {
  type        = bool
  default     = true
  description = "Whether"
}

variable "vm_web_kuliaev_nat" {
  type        = bool
  default     = true
  description = " NAT "
}

variable "vm_web_kuliaev_serial_port_enable" {
  type        = number
  default     = 1
  description = " serial port "
}

variable "vm_web_kuliaev_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family "
}

###
variable "vm_db_kuliaev_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name of the DB VM ance"
}

variable "vm_db_kuliaev_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID "
}

variable "vm_db_kuliaev_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Zone of the DB VM "
}

#variable "vm_db_kuliaev_cores" {
#  type        = number
#  default     = 2
#  description = "Number of CPU cores "
#}

#variable "vm_db_kuliaev_memory" {
#  type        = number
#  default     = 2
#  description = " memory "
#}

#variable "vm_db_kuliaev_core_fraction" {
#  type        = number
#  default     = 20
#  description = "Core fraction "
#}

variable "vm_db_kuliaev_serial_port_enable" {
  type        = number
  default     = 1
  description = " serial port "
  }

variable "vm_db_kuliaev_nat" {
  type        = bool
  default     = true
  description = " NAT "
}

variable "vm_db_kuliaev_preemptible" {
  type        = bool
  default     = true
  description = "Whether"
}
