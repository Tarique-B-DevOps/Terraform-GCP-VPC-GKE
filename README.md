# Terraform GCP VPC & GKE

This repository provisions infrastructure on **Google Cloud Platform (GCP)** using Terraform. It sets up a **Virtual Private Cloud (VPC)** and a **Google Kubernetes Engine (GKE)** cluster with modular, parameterized support and CI/CD automation via Jenkins.

---

## ⚙️ Features

- Modular design with `vpc` and `gke` Terraform modules  
- Supports multiple backend types: `remote`, `gcs`, `s3`, `azurerm`  
- Jenkinsfile for automated provisioning and destruction  
- Quick setup for repeatable infrastructure deployments on GCP

---

## 🚀 Quick Deployment Steps

1. Clone the repository

2. Change into the project directory  

3. Initialize Terraform with a backend config  
   terraform init -backend-config=`<path-to-backend-config-file>`

4. Preview infrastructure changes  
   terraform plan -var-file=`<path-to-var-file>`

5. Apply the configuration  
   terraform apply -var-file=`<path-to-var-file>`

---

## 🤖 Configure with Jenkins

This project includes a Jenkinsfile with parameterized deployment options:

- Select backend type: remote, gcs, s3, azurerm  
- Choose execution mode: local or remote (Terraform Cloud)  
- Input backend config and variable files  
- Toggle destroy mode for cleanup

### Jenkins Setup Steps

1. Create a new Jenkins pipeline job  
2. Point it to this GitHub repository  
3. Configure the following parameters:
   - BACKEND_TYPE (e.g., gcs)
   - HCP_EXEC_MODE (e.g., local)
   - BACKEND_CONFIG (e.g., gcs-staging.hcl)
   - TF_VAR_FILE (e.g., gcp.tfvars)
   - DESTROY_TERRAFORM (true/false)
4. Trigger the pipeline to deploy or destroy GCP infrastructure


![Image](https://github.com/user-attachments/assets/18a3728a-8beb-4185-a7f7-ca566e0867ea)