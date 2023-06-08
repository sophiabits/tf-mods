terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "cli" {
  triggers = {
    uuid = uuid()
  }

  provisioner "local-exec" {
    command = "vercel link --token=\"${var.vercel.token}\" --project=\"${var.vercel.project}\" --scope=\"${var.vercel.team}\" --yes && ${var.command}"
  }
}
