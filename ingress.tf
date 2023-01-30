resource "kubernetes_ingress_v1" "name" {
  metadata {
    name = "name"

    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      host = "phaniaz.xyz"

      http {
        path {
          path = "/"
        }
      }
    }
  }
}