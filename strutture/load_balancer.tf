# load_balancer2.tf
# La risorsa "random_id" "resource_unique_suffix" è stata spostata nel file random_resources.tf.
# Quindi, il blocco sottostante è stato rimosso da qui.

# Questo blocco CREA un nuovo indirizzo IP globale statico.
# Il nome sarà unico grazie al project ID e al suffisso casuale.
resource "google_compute_global_address" "static_ip" {
  name         = "lb-static-ip-${var.project}-${random_id.resource_unique_suffix.hex}"
  project      = var.project
  address_type = "EXTERNAL" # Specifica che è un IP esterno
}

resource "google_compute_url_map" "url_map" {
  # Nome unico per la URL Map, combinando un prefisso, il project ID e il suffisso casuale.
  name            = "url-map-${var.project}-${random_id.resource_unique_suffix.hex}"
  default_service = google_compute_backend_bucket.backend_bucket.id
}

resource "google_compute_target_http_proxy" "http_proxy" {
  # Nome unico per il Target HTTP Proxy.
  name    = "http-proxy-${var.project}-${random_id.resource_unique_suffix.hex}"
  url_map = google_compute_url_map.url_map.id
}

resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  # Nome unico per la Global Forwarding Rule.
  name       = "http-forwarding-rule-${var.project}-${random_id.resource_unique_suffix.hex}"
  # Ora l'IP sarà quello creato dalla risorsa 'google_compute_global_address.static_ip'
  ip_address = google_compute_global_address.static_ip.address
  port_range = "80"
  target     = google_compute_target_http_proxy.http_proxy.id
}