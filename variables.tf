variable "region" {
  description = "The Google Cloud Platform region, normally London."
  type        = string
  nullable    = false
}
variable "project_id" {
  description = "Primary Saundev environment in Google Cloud Platform."
  type        = string
  nullable    = false
}

# variable "env" {
#   description = "Environment assigned to resrouces."
#   type        = string
#   validation {
#     condition     = length(var.env) > 0 && contains(["dev", "prod"], var.env)
#     error_message = "Environment must be either dev or prod."
#   }
#   nullable = false
# }
