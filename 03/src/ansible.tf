resource "local_file" "inventory" {
     content = templatefile("${path.module}/inventory.tftpl", {
       webservers = [for instance in yandex_compute_instance.web : {
         name = instance.name
         ip   = instance.network_interface[0].nat_ip_address
         fqdn = instance.fqdn
       }]
       databases = [for instance in yandex_compute_instance.db : {
         name = instance.name
         ip   = instance.network_interface[0].nat_ip_address
         fqdn = instance.fqdn
       }]
       storage = [{
         name = yandex_compute_instance.storage.name
         ip   = yandex_compute_instance.storage.network_interface[0].nat_ip_address
         fqdn = yandex_compute_instance.storage.fqdn
       }]
     })
     filename = "${path.module}/inventory.yml"
   }
   