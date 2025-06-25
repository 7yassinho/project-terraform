# storage.tf
# Questo file gestisce il bucket di Google Cloud Storage per il sito statico e i suoi contenuti.

resource "google_storage_bucket" "static_site_bucket" {
  # Il nome del bucket sarà ora esattamente quello specificato nella variabile bucket_name.
  name          = var.bucket_name
  location      = var.region          # Utilizza la regione specificata nella variabile 'region'
  force_destroy = true                # Permette la distruzione del bucket anche se non vuoto (usare con cautela in produzione!)

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_object" "index_html" {
  name         = "index.html"
  bucket       = google_storage_bucket.static_site_bucket.name # Fa riferimento al nome del bucket appena creato
  content_type = "text/html"
  source       = "site/frontend/index.html" # Percorso al file locale
}

resource "google_storage_bucket_object" "app_js" {
  name         = "js/app.js"
  bucket       = google_storage_bucket.static_site_bucket.name
  content_type = "application/javascript"
  source       = "site/frontend/js/main.js" # Assicurati che questo percorso sia corretto
}

resource "google_storage_bucket_object" "app_json" {
  name         = "data/data.json"
  bucket       = google_storage_bucket.static_site_bucket.name
  content_type = "application/json"
  source       = "site/data/data.json" # Assicurati che questo percorso sia corretto
}

resource "google_storage_bucket_iam_binding" "public_read_access" {
  bucket = google_storage_bucket.static_site_bucket.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers" # Permette a tutti di leggere gli oggetti nel bucket (per siti web pubblici)
  ]
}