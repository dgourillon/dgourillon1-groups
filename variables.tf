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