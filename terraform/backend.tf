terraform {
  backend "gcs" {
    bucket = "mario-super-demo-tfstate"
    prefix = "terraform/state"
  }
}