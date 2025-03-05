import json
import os

terraform_inventory_path = os.path.abspath("../terraform/inventory.json")
hosts_file_path = os.path.abspath("./inventories/production/hosts.yml")

# Lire inventory.json
try:
    with open(terraform_inventory_path, "r") as f:
        tf_outputs = json.load(f)
except FileNotFoundError:
    print("Erreur : Le fichier inventory.json n'existe pas.")
    exit(1)

# Construire le contenu du fichier hosts.yml
hosts_data = f"""all:
  children:
    acr:
      hosts:
        acr-server:
          ansible_host: "{tf_outputs.get("acr_login_server", {}).get("value", "MISSING_ACR")}"
    vm:
      hosts:
        vm-server:
          ansible_host: "{tf_outputs.get("vm_public_ip_addresses", {}).get("value", "MISSING_VM_IP")}"
          ansible_user: "adminuser"
          ansible_ssh_private_key_file: "/tmp/terraform_vm_key.pem"
    aks:
      hosts:
        aks-server:
          ansible_host: "{tf_outputs.get("aks_cluster_name", {}).get("value", "MISSING_AKS")}"
"""

# Écrire dans hosts.yml
with open(hosts_file_path, "w") as f:
    f.write(hosts_data)

print(f"✅ Fichier hosts.yml généré avec succès : {hosts_file_path}")
