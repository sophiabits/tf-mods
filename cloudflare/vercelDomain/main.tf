terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

resource "cloudflare_zone" "this" {
  account_id = var.account_id
  zone       = var.name
}

resource "cloudflare_record" "this" {
  for_each = {
    bare = var.name
    www  = "www"
  }

  zone_id = cloudflare_zone.this.id
  name    = each.value
  type    = "A"
  value   = "76.76.21.21"
}

