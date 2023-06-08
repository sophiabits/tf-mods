terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

resource "cloudflare_record" "validation" {
  zone_id = var.zone_id
  comment = "Managed by Terraform"
  name    = "_vercel"
  type    = "TXT"
  value   = var.txt_validation
}

resource "cloudflare_record" "cname" {
  zone_id = var.zone_id
  comment = "Managed by Terraform"
  name    = var.name
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
}
