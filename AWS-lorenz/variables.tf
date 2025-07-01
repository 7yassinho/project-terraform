/* variables.tf
Questo file dichiara le variabili utilizzate dalla configurazione Terraform per AWS.
*/
variable "aws_region" {
  description = "La regione AWS dove verranno create le risorse (es. 'us-east-1' o 'eu-west-1')."
  type        = string
}

variable "bucket_name_prefix" {
  description = "Un prefisso per il nome del bucket S3. Verrà aggiunto un suffisso casuale per renderlo unico."
  type        = string
}

variable "ecr_repository_name" {
  description = "Il nome desiderato per il repository ECR (Elastic Container Registry)."
  type        = string
}

variable "project_name" {
  description = "Un nome per il progetto, usato per i tag delle risorse."
  type        = string
  default     = "dynamic-website-project"
}