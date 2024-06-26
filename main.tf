resource "flux_bootstrap_git" "this" {
  path                   = var.path
  cluster_domain         = var.cluster_domain
  components             = var.components
  components_extra       = var.components_extra
  interval               = var.interval
  log_level              = var.log_level
  embedded_manifests     = var.embedded_manifests
  namespace              = var.namespace
  network_policy         = var.network_policy
  secret_name            = var.secret_name
  version                = var.flux_version
  watch_all_namespaces   = var.watch_all_namespaces
  kustomization_override = var.kustomization_override
}
