# Questo file definisce gli output della configurazione Terraform.

output "cloudfront_distribution_domain_name" {
  description = "Il dominio della distribuzione CloudFront per il sito statico."
  value       = aws_cloudfront_distribution.static_site_distribution.domain_name
}