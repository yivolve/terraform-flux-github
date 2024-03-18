variable "path" {
  type        = string
  description = "(String) Path relative to the repository root, when specified the cluster sync will be scoped to this path."
}

variable "cluster_domain" {
  type = string
  description = "(String) The internal cluster domain. Defaults to cluster.local"
  default = "cluster.local"
}

variable "components" {
  type = set(string)
  description = "(Set of String) Toolkit components to include in the install manifests. Defaults to [source-controller kustomize-controller helm-controller notification-controller]"
  default = ["source-controller", "kustomize-controller", "helm-controller", "notification-controller"]
}

variable "components_extra" {
  type      = set(string)
  description = "List of extra components to include in the install manifests."
  default = [ "image-reflector-controller", "image-automation-controller" ]
}

variable "interval" {
  type = string
  description = "(String) Interval at which to reconcile from bootstrap repository. Defaults to 1m0s."
  default = "1m0s"
}

variable "log_level" {
  type = string
  description = "(String) Log level for toolkit components. Valid values are info, debug, error. /Defaults to info."
  default = "info"
}

variable "manifests_path" {
  type = string
  description = "(String) The install manifests are built from a GitHub release or kustomize overlay if using a local path. Defaults to https://github.com/fluxcd/flux2/releases."
  default = "https://github.com/fluxcd/flux2/releases"
}

variable "namespace" {
  type = string
  description = "(String) The namespace scope for install manifests. Defaults to flux-system. It will be created if it does not exist."
  default = "flux-system"
}

variable "network_policy" {
  type = bool
  description = "(Boolean) Deny ingress access to the toolkit controllers from other namespaces using network policies. Defaults to true."
  default = true
}

variable "secret_name" {
  type = string
  description = "(String) Name of the secret the sync credentials can be found in or stored to. Defaults to flux-system."
  default = "flux-system"
}

variable "flux_version" {
  type = string
  description = "(String) Flux version. Defaults to v2.2.3"
  default = "v2.2.3"
}

variable "watch_all_namespaces" {
  type = bool
  description = "(Boolean) If true watch for custom resources in all namespaces. Defaults to true."
  default = true
}
