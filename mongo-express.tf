resource "kubernetes_deployment" "mongo_express" {
  metadata {
    name = "mongo-express"

    labels = {
      app = "mongo-express"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mongo-express"
      }
    }

    template {
      metadata {
        labels = {
          app = "mongo-express"
        }
      }

      spec {
        container {
          name  = "mongo-express"
          image = "mongo-express"

          port {
            container_port = 8081
          }

          env {
            name = "ME_CONFIG_MONGODB_ADMINUSERNAME"

            value_from {
              secret_key_ref {
                name = "mongodb-secret"
                key  = "mongo-root-username"
              }
            }
          }

          env {
            name = "ME_CONFIG_MONGODB_ADMINPASSWORD"

            value_from {
              secret_key_ref {
                name = "mongodb-secret"
                key  = "mongo-root-password"
              }
            }
          }

          env {
            name = "ME_CONFIG_MONGODB_SERVER"

            value_from {
              config_map_key_ref {
                name = "mongodb-configmap"
                key  = "database_url"
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "mongo_express_service" {
  metadata {
    name = "mongo-express-service"
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 8081
      target_port = "8081"
      node_port   = 30000
    }

    selector = {
      app = "mongo-express"
    }

    type = "LoadBalancer"
  }
}