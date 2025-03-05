import json
import subprocess
import sys
# Définir le chemin correct du dossier Terraform
TERRAFORM_DIR = "/root/dev/unir_universidad/IaC-CP2-UNIR/terraform"
def get_terraform_outputs():
    try:
        # Exécuter Terraform dans le bon dossier
        result = subprocess.run(
            ["terraform", "output", "-json"],
            cwd=TERRAFORM_DIR,  # Assure l'exécution dans le bon dossier
            capture_output=True,
            text=True,
            check=True
        )
        
        if result.stdout.strip() == "":
            print("Erreur : Terraform output est vide.")
            sys.exit(1)

        return json.loads(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"Erreur lors de l'exécution de Terraform : {e}")
        sys.exit(1)
    except json.JSONDecodeError:
        print("Erreur : Impossible de décoder la sortie JSON de Terraform.")
        print("Terraform output brut :", result.stdout)
        sys.exit(1)

def generate_inventory(tf_outputs):
    acr_login_server = tf_outputs.get("acr_login_server", {}).get("value", "MISSING_ACR")
    vm_public_ip = tf_outputs.get("vm_public_ip", {}).get("value", "MISSING_VM")
    aks_cluster_name = tf_outputs.get("aks_cluster_name", {}).get("value", "MISSING_AKS")

    print(f"DEBUG ACR: {acr_login_server}")
    print(f"DEBUG VM: {vm_public_ip}")
    print(f"DEBUG AKS: {aks_cluster_name}")

    return {
        "all": {
        "children": {
            "acr": {
                "hosts": {
                    "acr-server": {
                        "ansible_host": tf_outputs.get("acr_login_server", {}).get("value", "MISSING_ACR")
                    }
                }
            },
            "vm": {
                "hosts": {
                    "vm-server": {
                        "ansible_host": tf_outputs.get("vm_public_ip_addresses", {}).get("value", "MISSING_VM_IP"),
                        "ansible_user": "adminuser",
                        "ansible_ssh_private_key_file": "/tmp/terraform_vm_key.pem"
                    }
                }
            },
            "aks": {
                "hosts": {
                    "aks-server": {
                        "ansible_host": tf_outputs.get("aks_cluster_name", {}).get("value", "MISSING_AKS")
                    }
                }
            }
        }
    }
}

tf_outputs = get_terraform_outputs()
inventory = generate_inventory(tf_outputs)

print(json.dumps(inventory, indent=2))
