resource "kubernetes_secret" "mongodb_secret" {
  metadata {
    name = "mongodb-secret"
  }

  data = {
    mongo-root-password = "cGFzc3dvcmQ="

    mongo-root-username = "dXNlcm5hbWU="
  }

  type = "Opaque"
}