# outputs2.tf
output "load_balancer_ip" {
  value = google_compute_global_address.static_ip.address # <--- CORREZIONE: rimosso "data."
}