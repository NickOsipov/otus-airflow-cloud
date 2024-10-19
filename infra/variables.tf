variable "yc_instance_user" {
  type = string  
}

variable "yc_instance_name" {
  type = string  
}

variable "yc_network_name" {
  type = string
}

variable "yc_subnet_name" {
  type = string
}

variable "yc_service_account_name" {
  type    = string
}

variable "ubuntu_image_id" {
  type    = string
}

variable "public_key_path" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "yc_config" {
  type = object({
    zone      = string
    folder_id = string
    token     = string
    cloud_id  = string
  })
  description = "Yandex Cloud configuration"
}