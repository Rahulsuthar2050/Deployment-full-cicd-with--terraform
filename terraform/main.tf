# 1. Create the Network
module "network" {
  source     = "./modules/networking"
  project_id = "mario-super-demo-496610"
}

# 2. Create the Artifact Registry for your Images
module "registry" {
  source     = "./modules/registry"
  project_id = "mario-super-demo-496610"
}

# 3. Create the GKE Cluster
module "gke" {
  source     = "./modules/cluster"
  project_id = "mario-super-demo-496610"
  vpc_id     = module.network.vpc_id
  subnet_id  = module.network.subnet_id
  service_account_email = var.gke_service_account
}