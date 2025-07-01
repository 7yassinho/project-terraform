#backend.tf
resource "google_compute_backend_bucket" "backend_bucket" {
  name        = var.backend_bucket_name # <-- ORA USA LA VARIABILE!
  bucket_name = google_storage_bucket.static_site_bucket.name
  enable_cdn  = true

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [name]
  }
}