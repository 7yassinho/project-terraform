# variables2.tf
variable "project" {
  description = "ID del progetto GCP"
  type        = string
  default     = "" # nomr del progetto su cui lavori 
}

variable "region" {
  description = "Regione GCP dove creare le risorse"
  type        = string
  default     = "" #regione del progetto
}

variable "zone" {
  description = "Zona GCP dove creare le risorse"
  type        = string
  default     = "" #regione in cui vera genrato il progetto
}

variable "network" {
  description = "Nome della rete VPC già esistente per GKE"
  type        = string
  default     = "" # La tua rete esistente
}

variable "subnet_gke_privata_name" {
  description = "Nome della subnet esistente per GKE"
  type        = string
  default     = "" # La tua subnet esistente
}

variable "gke_cluster_name" {
  description = "Nome del cluster GKE"
  type        = string
  default     = "test-cluster-1" #nome del cluster GKE
}

# Le variabili gke_pod_ip_range e gke_service_ip_range non sono più usate direttamente per creare i range
# ma se i tuoi altri script o configurazioni le usano per riferimento, potresti volerle mantenere.
# Per il deployment GKE, useremo solo i nomi dei range esistenti.
variable "gke_pod_ip_range" {
  description = "Intervallo IP dei Pod (questo è il CIDR effettivo per il range esistente)"
  type        = string
  default     = "11.3.0.0/16" # Corrisponde a "pods-range-new" o "gke-pods-range-2"
}

variable "gke_pod_ip_range_name" {
  description = "Nome intervallo secondario Pod esistente sulla subnet"
  type        = string
  default     = "gke-pods-range-2" # Usa questo nome di range esistente!
}

variable "gke_service_ip_range" {
  description = "Intervallo IP dei Servizi (questo è il CIDR effettivo per il range esistente)"
  type        = string
  default     = "11.4.0.0/20" # Corrisponde a "services-range-new" o "gke-services-range-2"
}

variable "gke_service_ip_range_name" {
  description = "Nome intervallo secondario Servizi esistente sulla subnet"
  type        = string
  default     = "gke-services-range-2" # Usa questo nome di range esistente!
}

variable "gke_node_count" {
  description = "Numero nodi pool"
  type        = number
  default     = 1
}

variable "master_ipv4_cidr_block" {
  description = "CIDR block per master privato"
  type        = string
  default     = "172.16.0.0/28"
}

variable "bucket_name" {
  description = "Nome base per il bucket di Google Cloud Storage per il sito statico"
  type        = string
  default     = "static-site-bucket"
}

variable "url_map_name" {
  description = "Nome URL map per il bilanciatore di carico"
  type        = string
  default     = "my-url-map"
}

variable "http_proxy_name" {
  description = "Nome HTTP proxy per il bilanciatore di carico"
  type        = string
  default     = "my-http-proxy"
}

variable "forwarding_rule_name" {
  description = "Nome forwarding rule per il bilanciatore di carico"
  type        = string
  default     = "my-forwarding-rule"
}

variable "backend_deployment_name" {
  description = "Nome del deployment del backend Kubernetes (per Cloud Run scaling)"
  type        = string
  default     = "backend" # Nome predefinito per il deployment Kubernetes
}

variable "kubernetes_namespace" {
  description = "Namespace Kubernetes dove si trova il deployment (per Cloud Run scaling)"
  type        = string
  default     = "progetto-web" # Il namespace predefinito che hai usato
}