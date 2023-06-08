variable "name" {
  type = string
}

variable "txt_validation" {
  description = "From Vercel console, e.g. `vc-domain-verify=subdomain.your-domain.com,dd25ce971d3d4a0f3b15`"
  type        = string
}

variable "zone_id" {
  description = "Root zone ID to attach subdomain"
  type        = string
}
