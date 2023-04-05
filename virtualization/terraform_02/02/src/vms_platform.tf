###cloud vars
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
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC68tSv0b6MTqfC5/hFL7wHQNn+znkaVx9yqvBDwxirw5emd5b8btXSdHpT70xVMPky6ILAU81m3siyw3NKn6MIXTldsQPSOf2FD5wMPmlYOQQ7b2gnmhugD43ebAssZhMSE+jRrh09UNA0vJlI0+qa4nErIQWEzPx5X3WTcU2FuzElpTrwIf9vmeLgNRrqE+IyRtsZDRxYvsSvkWTi0ELyM7LbXV25yCEZ4pwQETTB/WSolI3GIEeO9IXx9bdCDJUyh0h6Zw5EpjtM4yDnLCid4SzWutoKVtgLA4IPceV0mDEw86GFa0TSwHSW9NM1GNRmxHaIbDcfMy5b+mo6Xh62qDEosSB4pl5lXGbQG3p1k1pHq1vU138vb7hNHbs/9t4XkfYuR6uuJkCh9hUk64lX5yk1+AkIM3lGolkdPYvF/cWIdVuZCaDJdmvR6Rh5eU1iVWK4NVSvkhQ8mUDrzCxvRUkznufLbwpUeab3CmYVORC3x27Ww1ib6HuJnTf7dac= alekseykutlukaev@MacBook-Pro-Aleksej.local"
}


variable "image_name" {
  type = string
  description = "ubuntu"
  default = "ubuntu-2004-lts"
}

variable "instance_name" {
  type = string
  default = "netology-develop-platform-web"
}

variable "instance_name1" {
  type    = string
  default = "netology-develop-platform-bd"

  }

variable "vm_web_resources" {
  type        = map
  default     = {
    cores         = "2"
    memory        = "4"
    core_fraction = "5"
  }
}
variable "vm_db_resources" {
  type    = map
  default = {
    cores         = "2"
    memory        = "2"
    core_fraction = "20"
  }
}

variable "connect" {
  type = map
  default = {
    serial-port-enable = "1"
    ssh-keys = "ubuntu:var.vms_ssh_root_key}"
  }
}