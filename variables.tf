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

variable "metrics_remote_write_offer_url" {
  description = ""
  type = string
  default = ""
}

variable "logging_offer_url" {
  description = ""
  type = string
  default = ""
}