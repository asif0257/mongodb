provider "google" {
  project     = var.project_id
  region      = var.region
}

terraform {
  backend "gcs" {
    bucket = "tfstate-mongo"
    prefix = "terraform/tfstate"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
#   host        = "https://34.83.69.182"

}