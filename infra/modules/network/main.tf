resource "yandex_vpc_network" "yc_network" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = var.subnet_name
  zone           = var.provider_config.zone
  network_id     = yandex_vpc_network.yc_network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

