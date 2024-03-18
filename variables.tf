variable "name" {
  type        = string
  description = "(Required) The name of the repository."
}

variable "description" {
  type        = string
  description = "(Optional) A description of the repository."
}

variable "visibility" {
  type        = string
  description = "(Optional) A description of the repository."
}

variable "delete_branch_on_merge" {
  type        = bool
  description = "(Optional) Automatically delete head branch after a pull request is merged. Defaults to false."
  default     = false
}

variable "auto_init" {
  type        = bool
  description = "(Optional) Set to true to produce an initial commit in the repository."
  default     = false
}

variable "homepage_url" {
  type        = string
  description = "(Optional) URL of a page describing the project."
  default     = null
}

variable "topics" {
  type        = list(string)
  description = "(Optional) The list of topics of the repository."
  default     = []
}
