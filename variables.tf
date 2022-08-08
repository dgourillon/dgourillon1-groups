variable "default_password" {

  description = "default password for ceated users"
  type        = string

}

variable "customer_id" {

  description = "customer_id of our cloud identity"
  type        = string

}

variable "organization" {
  description = "Organization details."
  type = object({
    domain      = string
    id          = number
    customer_id = string
  })
}

variable "default_recovery_email" {

  description = "Default recovery email for the created user"
  type        = string

}

variable "default_group_member " {

  description = "Default email addresses to set in the groups"
  type        = string
  default     = null

}

variable "group_deployment_deployment_sa " {

  description = "owner SA for the groups"
  type        = string


}

