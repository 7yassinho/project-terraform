/* artifact_registry.tf
# Questo file crea un Google Cloud Artifact Registry.

resource "google_artifact_registry_repository" "my_repository" {
  # Il nome del repository. Verrà prelevato dalla variabile.
  # Ti consiglio di aggiungere questa variabile al tuo file variables.tf e terraform.tfvars.
  repository_id = var.artifact_registry_name
  description   = "Repository per immagini Docker e altri artefatti del progetto ${var.project}"
  format        = "DOCKER" # Puoi scegliere altri formati come 'NPM', 'MAVEN', 'PYTHON', 'GENERIC_PACKAGE'
  location      = var.region # Utilizza la regione specificata nella variabile 'region'
  project       = var.project # Il tuo project ID
}

output "artifact_registry_repository_url" {
  description = "URL del repository Artifact Registry creato."
  value       = google_artifact_registry_repository.my_repository.name
}
*/