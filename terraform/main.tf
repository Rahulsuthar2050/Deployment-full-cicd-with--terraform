# 1. Create the Network
module "network" {
  source     = "./modules/networking"
  project_id = "mario-super-demo"
}

# 2. Create the Artifact Registry for your Images
module "registry" {
  source     = "./modules/registry"
  project_id = "mario-super-demo"
}

# 3. Create the GKE Cluster
module "gke" {
  source     = "./modules/cluster"
  project_id = "mario-super-demo"
  vpc_id     = module.network.vpc_id
  subnet_id  = module.network.subnet_id
  service_account_email = var.gke_service_account
}