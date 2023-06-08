output "access_key_id" {
  value = cloudflare_api_token.this.id
}

output "bucket_id" {
  value = cloudflare_r2_bucket.this.id
}

output "secret_access_key" {
  value = sha256(cloudflare_api_token.this.value)
}

output "s3_endpoint" {
  value = "https://${var.account_id}.r2.cloudflarestorage.com"
}
