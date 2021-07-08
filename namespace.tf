# Issue where non-existent namespace does not result in
# failure behavior.
# https://github.com/terraform-providers/terraform-provider-helm/issues/427

resource "kubernetes_namespace" "secrets" {
  count = 1
  metadata {
    annotations = {
      name = var.namespace
    }

    labels = {
      purpose = "consul"
    }

    name = var.namespace
  }
}
