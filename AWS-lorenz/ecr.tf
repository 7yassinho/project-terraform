# Questo file crea un AWS Elastic Container Registry (ECR) repository.

resource "aws_ecr_repository" "my_repository" {
  # Il nome del repository.
  name = var.ecr_repository_name
  
  # Abilita la scansione delle immagini al push per rilevare vulnerabilità.
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project = var.project_name
  }
}