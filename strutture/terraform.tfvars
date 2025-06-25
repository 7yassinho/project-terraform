# terraform.tfvars
# Questo file contiene i valori specifici per il deployment corrente.
# Terraform lo caricherà automaticamente.
# Decommenta le righe e inserisci i valori appropriati per il tuo progetto.

# project                   = "il-tuo-project-id-gcp"              # L'ID del progetto GCP (es. "my-project-12345")
# region                    = "la-tua-regione-gcp"                  # La regione GCP (es. "us-central1", "europe-west1")
# zone                      = "la-tua-zona-gcp"                     # La zona GCP (es. "us-central1-a", "europe-west1-b")
# network                   = "nome-della-tua-rete-vpc"             # Il nome della rete VPC esistente
# subnet_gke_privata_name   = "nome-della-tua-subnet-gke"         # Il nome della subnet esistente per GKE
# gke_cluster_name          = "nome-desiderato-per-il-cluster"      # Il nome del cluster GKE
# gke_pod_ip_range          = "cidr-range-pods"                     # Il CIDR reale del range secondario per i Pod (es. "10.0.0.0/16")
# gke_pod_ip_range_name     = "nome-range-pods"                     # Il nome del range secondario per i Pod
# gke_service_ip_range      = "cidr-range-services"                 # Il CIDR reale del range secondario per i Servizi (es. "10.1.0.0/20")
# gke_service_ip_range_name = "nome-range-services"                 # Il nome del range secondario per i Servizi
# gke_node_count            = 1                                     # Il numero di nodi per il pool di nodi del cluster GKE
# master_ipv4_cidr_block    = "cidr-master-privato"                 # Il blocco CIDR IPv4 per il piano di controllo privato (es. "172.16.0.0/28")
# bucket_name               = "nome-base-bucket-sito-statico"       # Il nome base per il bucket GCS del sito statico
# url_map_name              = "nome-url-map"                        # Il nome per la risorsa URL Map del bilanciatore di carico
# http_proxy_name           = "nome-http-proxy"                     # Il nome per la risorsa HTTP Proxy del bilanciatore di carico
# forwarding_rule_name      = "nome-forwarding-rule"                # Il nome per la risorsa Global Forwarding Rule del bilanciatore di carico
# backend_deployment_name   = "nome-deployment-kubernetes-backend"  # Il nome del Deployment Kubernetes che verrà scalato da Cloud Run
# kubernetes_namespace      = "namespace-kubernetes"                # Il namespace Kubernetes dove si trova il Deployment