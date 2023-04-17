
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
  for_each    = toset(var.vm_names)
  name        = each.value
  platform_id = "standard-v1"
  resources {

  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu1.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop1.id
    nat       = true
  }

}