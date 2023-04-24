
resource "yandex_vpc_network" "develop1" {
  name = var.vpc_name1
}
resource "yandex_vpc_subnet" "develop1" {
  name           = var.vpc_name1
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop1.id
  v4_cidr_blocks = var.default_cidr
}
data "yandex_compute_image" "ubuntu1" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "vm" {
  for_each = {
  for i, vm in var.vms : vm.vm_name => {
    name = "vm-${vm.vm_name}"
    cores = vm.cores
    memory = vm.memory
    disk   = vm.disk
}
  }
  resources {
    cores    = each.value.cores
    memory = each.value.memory
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu1.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop1.id
    nat = true
  }
  provisioner "file" {
    source = "./id_rsa.pub"
    destination = "/root/.ssh/id_rsa.pub"
}
  connection {
type = "ssh"
user = "ubuntu"
private_key = "~/ssh/id_rsa"
    host = "self.public_ip"
}
  metadata = {
    serial-port-enable = var.connect.serial-port-enable
    ssh-keys           = var.connect.ssh-keys
  }

depends_on = [
    yandex_compute_instance.web
  ]
}


