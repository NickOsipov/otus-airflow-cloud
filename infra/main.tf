# main.tf

module "iam" {
  source          = "./modules/iam"
  name            = var.yc_service_account_name
  provider_config = var.yc_config
}

module "network" {
  source          = "./modules/network"
  network_name    = var.yc_network_name
  subnet_name     = var.yc_subnet_name
  provider_config = var.yc_config
}

module "compute" {
  source             = "./modules/compute"
  instance_user      = var.yc_instance_user
  instance_name      = var.yc_instance_name
  service_account_id = module.iam.service_account_id
  subnet_id          = module.network.subnet_id
  ubuntu_image_id    = var.ubuntu_image_id
  public_key_path    = var.public_key_path
  private_key_path   = var.private_key_path
  provider_config    = var.yc_config
}
