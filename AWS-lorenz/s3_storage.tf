# Questo file gestisce il bucket S3 per l'hosting del sito statico e il caricamento dei suoi contenuti.

# Crea un nome unico per il bucket S3 combinando il prefisso e un suffisso casuale.
locals {
  static_site_bucket_name = "${var.bucket_name_prefix}-${random_string.bucket_suffix.result}"
}

# 1. Crea il bucket S3.
resource "aws_s3_bucket" "static_site_bucket" {
  bucket = local.static_site_bucket_name

  # Consente la distruzione del bucket anche se contiene oggetti (usare con cautela!).
  force_destroy = true

  tags = {
    Project = var.project_name
  }
}

# 2. Abilita la configurazione di sito web statico sul bucket.
resource "aws_s3_bucket_website_configuration" "static_site_bucket_website" {
  bucket = aws_s3_bucket.static_site_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "404.html"
  }
}

# 3. Carica i file locali nel bucket S3.
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.static_site_bucket.id
  key          = "index.html"
  source       = "site/frontend/index.html"
  content_type = "text/html"
  # etag assicura che Terraform aggiorni l'oggetto se il file locale cambia.
  etag         = filemd5("site/frontend/index.html")
}

resource "aws_s3_object" "app_js" {
  bucket       = aws_s3_bucket.static_site_bucket.id
  key          = "js/app.js"
  source       = "site/frontend/js/main.js"
  content_type = "application/javascript"
  etag         = filemd5("site/frontend/js/main.js")
}

resource "aws_s3_object" "app_json" {
  bucket       = aws_s3_bucket.static_site_bucket.id
  key          = "data/data.json"
  source       = "site/data/data.json"
  content_type = "application/json"
  etag         = filemd5("site/data/data.json")
}