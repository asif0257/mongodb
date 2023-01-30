resource "kubernetes_ingress_v1" "godaddy" {
  metadata {
    name = "name"

    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      host = "$NGINX_INGRESS_IP.nip.io"

      http {
        path {
          path = "/"
        }
      }
    }
  }
}