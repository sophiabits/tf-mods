variable "account_id" {
  type = string
}

variable "name" {
  description = "Domain name, e.g. `my-cool-app.com`"
  type        = string
}

variable "verification" {
  type = object({
    bare = string
    www  = string
  })
}
