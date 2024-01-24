variable "channel" {
  description = "The channel to use when deploying a charm "
  type        = string
  default     = "latest/stable"
}

variable "model_name" {
  description = "Name of Juju model to deploy application to"
  type        = string
  default     = ""
}
