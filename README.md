# IaC-CP2-UNIR

IaC to create two instances in Azure cloud provider. Using Terraform and Ansible, I want a VM with Podman and a web app and in the other instance I want a cluster Kubernetes with an app having persistance data.

# IaC-CP2-UNIR

This project uses Infrastructure as Code (IaC) to create resources in the Azure cloud provider. It leverages Terraform and Ansible to provision and configure the following:

1. A Virtual Machine (VM) with Podman and a web application.
2. A Kubernetes cluster with an application that has persistent data.

## Project Structure

terraform
-modules/
--acr/
--aks/
--network/
--security/
--vm/

    ## Prerequisites

- Terraform >= 1.3.0
- Ansible
- Azure CLI

## Setup

1. Clone the repository:

   ```sh
   git clone <repository-url>
   cd IaC-CP2-UNIR/terraform
   ```

2. Configure your Azure credentials in [terraform.tfvars](http://_vscodecontentref_/19):

   ```tfvars
   subscription_id = "your-subscription-id"
   client_id       = "your-client-id"
   client_secret   = "your-client-secret"
   tenant_id       = "your-tenant-id"
   ```

3. Initialize Terraform:

   ```sh
   terraform init
   ```

4. Apply the Terraform configuration:
   ```sh
   terraform apply
   ```

## Modules

### ACR (Azure Container Registry)

- **Path:** [acr](http://_vscodecontentref_/20)
- **Description:** Creates an Azure Container Registry and assigns roles for VM and AKS to pull images.

### AKS (Azure Kubernetes Service)

- **Path:** [aks](http://_vscodecontentref_/21)
- **Description:** Creates an AKS cluster.

### Network

- **Path:** [network](http://_vscodecontentref_/22)
- **Description:** Creates a virtual network, subnets, and network interfaces.

### Security

- **Path:** [security](http://_vscodecontentref_/23)
- **Description:** Creates network security groups and associates them with network interfaces.

### VM (Virtual Machine)

- **Path:** [vm](http://_vscodecontentref_/24)
- **Description:** Creates a Linux virtual machine with SSH key-based authentication and associates it with an availability set.

## Outputs

- **ACR Login Server:** `module.acr.acr_login_server`
- **VM Public IP:** `module.vm.vm_public_ip`
- **VM Private IPs:** `module.vm.vm_private_ips`
- **AKS Cluster Name:** `module.aks.aks_cluster_name`
- **AKS Node Resource Group:** `module.aks.aks_node_resource_group`

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](http://_vscodecontentref_/25) file for details.
