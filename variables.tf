variable "region" {
  description = "The Google Cloud Platform region, normally London."
  type        = string
}
variable "project_id" {
  description = "Primary Saundev environment in Google Cloud Platform."
  type        = string
}

variable "env" {
  description = "Environment assigned to resrouces."
  type        = string
  validation {
    condition     = length(var.env) > 0 && contains(["dev", "prod"], var.env)
    error_message = "Environment must be either dev or prod."
  }
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  sensitive   = true
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}
