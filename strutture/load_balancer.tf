# load_balancer.tf
# La risorsa "random_id" "resource_unique_suffix" non è più utilizzata per i nomi casuali.

# Questo blocco CREA un nuovo indirizzo IP globale statico.
# Il nome sarà quello specificato nella variabile.
resource "google_compute_global_address" "static_ip" {
  name         = "lb-static-ip-${var.project}" # Utilizza il project ID per unicità, se non hai una variabile specifica per questo nome
  project      = var.project
  address_type = "EXTERNAL" # Specifica che è un IP esterno
}

resource "google_compute_url_map" "url_map" {
  # Nome dalla variabile url_map_name.
  name            = var.url_map_name
  default_service = google_compute_backend_bucket.backend_bucket.id
}

resource "google_compute_target_http_proxy" "http_proxy" {
  # Nome dalla variabile http_proxy_name.
  name    = var.http_proxy_name
  url_map = google_compute_url_map.url_map.id
}

resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  # Nome dalla variabile forwarding_rule_name.
  name       = var.forwarding_rule_name
  # Ora l'IP sarà quello creato dalla risorsa 'google_compute_global_address.static_ip'
  ip_address = google_compute_global_address.static_ip.address
  port_range = "80"
  target     = google_compute_target_http_proxy.http_proxy.id
}