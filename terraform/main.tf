# 1. Create the Network
module "network" {
  source     = "./modules/networking"
  project_id = var.project_id
}

# 2. Create the Artifact Registry for your Images
module "registry" {
  source     = "./modules/registry"
  project_id = var.project_id
}

# 3. Create the GKE Cluster
module "gke" {
  source     = "./modules/cluster"
  project_id = var.project_id
  vpc_id     = module.network.vpc_id
  subnet_id  = module.network.subnet_id
}