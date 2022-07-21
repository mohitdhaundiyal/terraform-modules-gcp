// variable decleration : initalization in terrafrom.tfvars
variable "networks" {
  type = list(object({
    name                            = optional(string)
    auto_create_subnetworks         = optional(bool)
    routing_mode                    = optional(string)
    project                         = optional(string)
    description                     = optional(string)
    delete_default_routes_on_create = optional(bool)
    mtu                             = optional(number)
  }))

  description = "The list of network details."
  default     = []
}
