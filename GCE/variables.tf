variable "instances" {
  type = list(object({
    name                    = optional(string)
    machine_type            = optional(string)
    zone                    = optional(string)
    labels                  = optional(map(any))
    image                   = optional(string)
    network_interface       = optional(string)
    metadata                = optional(map(any))
    metadata_startup_script = optional(string)
  }))

  description = "The list of instance details."
  default     = []
}
