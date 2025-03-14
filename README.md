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

ansible
-inventories/
--production/
---hosts
-playbooks/
--setup.yml
-roles/
--vm/
---tasks/
----main.yml
--aks/
---tasks/
----main.yml

    ## Prerequisites

- Terraform
- Ansible
- Azure CLI

## Setup

1. Clone the repository:

   ```sh
   git clone https://github.com/cedriclecalvez/IaC-CP2-UNIR
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
   cd terraform
   terraform init
   ```

4. Plan the deployment:

   ```sh
   terraform plan
   ```

5. Apply the deployment:

   ```sh
   terraform apply
   ```

6. Retrieve the outputs:

   ```sh
   terraform output
   ```

7. Configure Ansible vars from terraform:

   ```sh
   cd ansible
   python3 ./var_plugins/terraform_vars.py
   ```

8. Put manually the ip of the VM in hosts files

kubectl create secret generic mongodb-secret-unir \
 --namespace my-aks-unir \
 --from-literal=MONGO_INITDB_ROOT_USERNAME=xxx \
 --from-literal=MONGO_INITDB_ROOT_PASSWORD=xxx

kubectl get secret mongodb-secret-unir -n my-aks-unir -o yaml

9. Launch Ansible to apply configuration:

   ```sh
   ansible-playbook playbooks/setup.yml
   ```

Extra:

Connect to azure VM:

```
ssh adminuser@<ip_adress>
```

Check image on azure container registry:

```
az acr repository show --name <acr_name> --repository casopractico2/e-commerce-angular17
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

- **Resource Group Name:** `output.resource_group_name`
- **Location:** `output.location`
- **Storage Account Name:** `output.storage_account_name`
- **VM IDs:** `module.vm.vm_ids`
- **VM Principal ID:** `module.vm.vm_principal_id`
- **VM Public IP Addresses:** `module.vm.vm_public_ip_addresses`
- **AKS Cluster Name:** `module.aks.aks_cluster_name`
- **AKS Node Resource Group:** `module.aks.aks_node_resource_group`
- **AKS Public IP:** `module.aks.aks_public_ip`
- **NIC ID:** `module.network.nic_id`
- **Virtual Network ID:** `module.network.vnet_id`
- **Subnet ID:** `module.network.subnet_id`
- **ACR Login Server:** `module.acr.acr_login_server`
- **ACR Username:** `module.acr.acr_username`
- **ACR Password:** `module.acr.acr_password`

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](http://_vscodecontentref_/25) file for details.
