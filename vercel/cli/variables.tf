variable "command" {
  type = string
}

variable "vercel" {
  type = object({
    project = string
    team    = string
    token   = string
  })
}
