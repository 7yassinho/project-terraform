/* random_resources.tf
resource "random_id" "bucket_suffix" {
  byte_length = 4 # Genera un suffisso di 8 caratteri esadecimali
}

resource "random_id" "resource_unique_suffix" {
  byte_length = 4 # Genera un suffisso di 8 caratteri esadecimali
}
*/