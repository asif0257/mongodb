resource "kubernetes_ingress_v1" "godaddy" {
  metadata {
    name = "phaniingress"

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