terraform {
  backend "gcs" {
    bucket = "mario-super-demo-tfstate-1"
    prefix = "terraform/state"
  }
}