variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "provider_config" {
  description = "Yandex Cloud configuration"
  type        = object({
    zone      = string
    folder_id = string
    token     = string
    cloud_id  = string
  })
}
