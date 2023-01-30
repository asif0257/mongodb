resource "kubernetes_config_map" "mongodb_configmap" {
  metadata {
    name = "mongodb-configmap"
  }

  data = {
    database_url = "mongodb-service"
  }
  depends_on = [
    kubernetes_deployment.mongodb_deployment
  ]
}