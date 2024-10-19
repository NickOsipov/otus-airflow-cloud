resource "yandex_compute_instance" "vm" {
  name               = var.instance_name
  service_account_id = var.service_account_id
  
  scheduling_policy {
    preemptible = true
  }

  resources {
    cores  = 2
    memory = 8
    core_fraction = 20 # 20% vCPU
  }

  boot_disk {
    initialize_params {
      image_id = var.ubuntu_image_id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.instance_user}:${file(var.public_key_path)}"
    serial-port-enable = "1"
  }

  connection {
    type        = "ssh"
    user        = var.instance_user
    private_key = file(var.private_key_path)
    host        = self.network_interface.0.nat_ip_address
  }

  provisioner "file" {
    source      = "${path.module}/scripts/setup.sh"
    destination = "/home/${var.instance_user}/setup.sh"
  }

}

resource "null_resource" "update_env_with_airflow_host" {
  provisioner "local-exec" {
    command = <<EOT
      # Определяем переменную AIRFLOW_HOST
      AIRFLOW_HOST=${yandex_compute_instance.vm.network_interface.0.nat_ip_address}

      # Замена переменной AIRFLOW_HOST в .env
      sed -i "s/^AIRFLOW_HOST=.*/AIRFLOW_HOST=$AIRFLOW_HOST/" ../.env
    EOT
  }
}