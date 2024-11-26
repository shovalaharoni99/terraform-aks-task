
# Welcome to Infestrtor Toolset!

This repository provides the basic configuration to set up your own AKS environment with ArgoCD built in.

## Prerequisites

Before getting started, ensure the following are installed on your system:
- **Terraform CLI**
- **Azure CLI**

## Getting Started

1. Clone the repository and initialize Terraform:
   ```bash
   terraform init -upgrade
   ```

2. Plan your Terraform configuration:
   ```bash
   terraform plan
   ```

3. Validate your Terraform configuration:
   ```bash
   terraform validate
   ```

## Required Variables

Make sure to configure the following variables before applying Terraform:
- Your **Azure Subscription**
- Your **Git repository** where all your application YAML files are stored.

## Installation Steps

After successful installation:

1. Get AKS credentials:
   ```bash
   az aks get-credentials --resource-group aks-task --name myAks
   ```

2. To access ArgoCD, retrieve the load balancer port:
   ```bash
   kubectl get svc -n argocd
   ```

3. Obtain the admin user password with the following command:
   ```bash
   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
   ```

   The admin username is `admin`.

4. Log in to ArgoCD and you will see all your applications.

## Done!
You have successfully set up your AKS environment with ArgoCD.

---

### Notes
For further assistance, refer to the official Terraform and Azure CLI documentation.
