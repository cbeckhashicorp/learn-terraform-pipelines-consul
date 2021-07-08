resource "helm_release" "consul" {
  count      = 1
  depends_on = [kubernetes_namespace.secrets]
  name       = "${var.release_name}-consul"
  chart      = "${path.module}/consul-helm"
  namespace  = var.namespace

  set {
    name  = "global.name"
    value = "consul"
  }

  set {
    name  = "server.replicas"
    value = var.replicas
  }

  set {
    name  = "server.bootstrapExpect"
    value = var.replicas
  }
}
