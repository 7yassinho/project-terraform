# terraform.tfvars
# Questo file è utilizzato per fornire i valori specifici delle variabili per il tuo progetto.
# Terraform lo caricherà automaticamente.
# Decommenta le righe necessarie e inserisci i valori appropriati per il tuo deployment.

project                   = "IL_TUO_PROJECT_ID_GCP"              # Esempio: "my-gcp-project-12345"
region                    = "LA_TUA_REGIONE_GCP"                  # Esempio: "us-central1" o "europe-west1"
zone                      = "LA_TUA_ZONA_GCP"                     # Esempio: "us-central1-a" o "europe-west1-b"
network                   = "NOME_DELLA_TUA_RETE_VPC"             # Esempio: "mia-rete-privata-gke"
subnet_gke_privata_name   = "NOME_DELLA_TUA_SUBNET_GKE"         # Esempio: "subnet-gke-privata"
gke_cluster_name          = "NOME_DESIDERATO_PER_IL_CLUSTER"      # Esempio: "test-cluster-1"
gke_pod_ip_range          = "CIDR_RANGE_PODS"                     # Esempio: "10.0.0.0/16"
gke_pod_ip_range_name     = "NOME_RANGE_PODS"                     # Esempio: "gke-pods-range"
gke_service_ip_range      = "CIDR_RANGE_SERVICES"                 # Esempio: "10.1.0.0/20"
gke_service_ip_range_name = "NOME_RANGE_SERVICES"                 # Esempio: "gke-services-range"
gke_node_count            = 1                                     # Esempio: 1 (numero di nodi)
master_ipv4_cidr_block    = "CIDR_MASTER_PRIVATO"                 # Esempio: "172.16.0.0/28"
bucket_name               = "NOME_BASE_BUCKET_SITO_STATICO"       # Esempio: "my-static-site-bucket"
url_map_name              = "NOME_URL_MAP"                        # Esempio: "my-url-map"
http_proxy_name           = "NOME_HTTP_PROXY"                     # Esempio: "my-http-proxy"
forwarding_rule_name      = "NOME_FORWARDING_RULE"                # Esempio: "my-forwarding-rule"
backend_deployment_name   = "NOME_DEPLOYMENT_KUBERNETES_BACKEND"  # Esempio: "backend"
kubernetes_namespace      = "NAMESPACE_KUBERNETES"                # Esempio: "default"