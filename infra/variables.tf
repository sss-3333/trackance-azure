variable "project" {
  description = "Name used in every resource name"
  type        = string
  default     = "trackance"
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "uksouth"
}

variable "custom_domain" {
  description = "Domain users visit"
  type        = string
  default     = "tm.trackance.co.uk"
}