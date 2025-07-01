/* random_resources.tf
Questo file genera un suffisso casuale per garantire l'unicità dei nomi delle risorse.
*/
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
  numeric = true
}