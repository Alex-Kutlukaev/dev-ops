output "instance_name" {
  value = "${resource.yandex_compute_instance.platform.name}"
}
output "public_ip" {
  value = "${resource.yandex_compute_instance.platform.network_interface.0.nat_ip_address}"
}
#######################
output "instanse_name1" {
  value = "${resource.yandex_compute_instance.platform1.name}"
}
output "public_ip1" {
  value = "${resource.yandex_compute_instance.platform1.network_interface.0.nat_ip_address}"

}