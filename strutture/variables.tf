/* variables.tf
Questo file dichiara le variabili utilizzate dalla configurazione Terraform.
Non contiene valori di default, il che significa che i valori
DEVONO essere forniti tramite un file .tfvars (es. terraform.tfvars)
o attraverso variabili d'ambiente/linea di comando.
*/
variable "project" {
  description = "L'ID del progetto Google Cloud Platform."
  type        = string
}

variable "region" {
  description = "La regione GCP dove verranno create la maggior parte delle risorse (es. 'us-central1' o 'europe-west1')."
  type        = string
}

variable "zone" {
  description = "La zona GCP specifica all'interno della regione (es. 'us-central1-a' o 'europe-west1-b')."
  type        = string
}

variable "network" {
  description = "Il nome della rete VPC esistente a cui il cluster GKE e altre risorse si connetteranno."
  type        = string
}

variable "subnet_gke_privata_name" {
  description = "Il nome della subnet esistente all'interno della rete VPC, dove verrà creato il cluster GKE."
  type        = string
}

variable "gke_cluster_name" {
  description = "Il nome desiderato per il cluster GKE."
  type        = string
}

variable "gke_pod_ip_range" {
  description = "L'intervallo IP CIDR per i Pod del cluster GKE (questo è il CIDR effettivo per il range secondario dei Pod sulla subnet)."
  type        = string
}

variable "gke_pod_ip_range_name" {
  description = "Il nome del range IP secondario esistente sulla subnet per i Pod del cluster GKE (nome di riferimento per Terraform)."
  type        = string
}

variable "gke_service_ip_range" {
  description = "L'intervallo IP CIDR per i Servizi del cluster GKE (questo è il CIDR effettivo per il range secondario dei Servizi sulla subnet)."
  type        = string
}

variable "gke_service_ip_range_name" {
  description = "Il nome del range IP secondario esistente sulla subnet per i Servizi del cluster GKE (nome di riferimento per Terraform)."
  type        = string
}

variable "gke_node_count" {
  description = "Il numero di nodi desiderato per il pool di nodi del cluster GKE."
  type        = number
}

variable "master_ipv4_cidr_block" {
  description = "Il blocco CIDR IPv4 per il piano di controllo privato del cluster GKE. Questo CIDR non deve sovrapporsi con altre reti."
  type        = string
}

variable "bucket_name" {
  description = "Il nome base per il bucket di Google Cloud Storage che ospiterà il sito statico."
  type        = string
}

variable "url_map_name" {
  description = "Il nome per la risorsa URL Map del bilanciatore di carico HTTP(S)."
  type        = string
}

variable "http_proxy_name" {
  description = "Il nome per la risorsa HTTP Proxy del bilanciatore di carico HTTP(S)."
  type        = string
}

variable "forwarding_rule_name" {
  description = "Il nome per la risorsa Global Forwarding Rule del bilanciatore di carico HTTP(S)."
  type        = string
}

variable "backend_deployment_name" {
  description = "Il nome del Deployment Kubernetes che verrà scalato da Cloud Run."
  type        = string
}

variable "kubernetes_namespace" {
  description = "Il namespace Kubernetes dove è situato il Deployment che Cloud Run scalerà."
  type        = string
}

variable "backend_bucket_name" {
  description = "Il nome del backend bucket per il bilanciatore di carico."
  type        = string
}