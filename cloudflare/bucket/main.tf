terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.7"
    }
  }
}

resource "cloudflare_r2_bucket" "this" {
  account_id = var.account_id
  name       = var.name
  location   = "APAC"
}

data "cloudflare_api_token_permission_groups" "all" {}

resource "cloudflare_api_token" "this" {
  name = "${var.name}-r2"

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.permissions["Workers R2 Storage Read"],
      data.cloudflare_api_token_permission_groups.all.permissions["Workers R2 Storage Write"],
    ]
    resources = {
      "com.cloudflare.api.account.${var.account_id}" : "*"
    }
  }
}
