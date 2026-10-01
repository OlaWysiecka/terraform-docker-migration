module "network" {
  source = "../../modules/network"

  name = var.network_name
}

module "database" {
  source = "../../modules/database"

  volume_name       = var.database_volume_name
  network_name      = var.network_name
  database_name     = var.database_name
  database_user     = var.database_user
  database_password = var.database_password
}
module "web" {
  source = "../../modules/web"

  network_name = var.network_name
}
