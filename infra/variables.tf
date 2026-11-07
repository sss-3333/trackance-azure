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