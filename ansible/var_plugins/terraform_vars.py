import json
import subprocess
import os
import yaml
from ansible.plugins.vars import BaseVarsPlugin
from ansible.errors import AnsibleError

class VarsModule(BaseVarsPlugin):

    def get_vars(self, loader, path, entities, cache=True):
        super(VarsModule, self).get_vars(loader, path, entities)
        terraform_dir = "/root/dev/unir_universidad/IaC-CP2-UNIR/terraform"
        inventory_dir = "/root/dev/unir_universidad/IaC-CP2-UNIR/ansible/inventories/production"
        output_file = os.path.join(inventory_dir, "all_group_vars_secret.yml")

        if not os.path.exists(inventory_dir):
            raise AnsibleError(f"Erreur : Le dossier {inventory_dir} n'existe pas.")

        try:
            result = subprocess.run(
                ["terraform", "output", "-json"],
                cwd=terraform_dir,
                capture_output=True,
                text=True,
                check=True
            )
            if result.stdout.strip() == "":
                raise AnsibleError("Erreur : Terraform output est vide.")
            tf_outputs = json.loads(result.stdout)
        except subprocess.CalledProcessError as e:
            raise AnsibleError(f"Erreur lors de l'exécution de Terraform : {e}")
        except json.JSONDecodeError:
            raise AnsibleError("Erreur : Impossible de décoder la sortie JSON de Terraform.")

        vars_dict = {
            'acr_login_server': tf_outputs.get('acr_login_server', {}).get('value', 'MISSING_ACR'),
            'acr_username': tf_outputs.get('acr_username', {}).get('value', 'MISSING_USERNAME'),
            'acr_password': tf_outputs.get('acr_password', {}).get('value', 'MISSING_PASSWORD'),
            'vm_public_ip': tf_outputs.get('vm_public_ip_addresses', {}).get('value', ['MISSING_VM_IP'])[0],
            'vm_user': 'adminuser',
            'vm_private_key_path': '/tmp/terraform_vm_key.pem',
            'aks_cluster_name': tf_outputs.get('aks_cluster_name', {}).get('value', 'MISSING_AKS'),
            'aks_kube_config': tf_outputs.get('aks_kube_config', {}).get('value', 'MISSING_KUBE_CONFIG')
        }

        # Write the variables to the output file in YAML format
        try:
            with open(output_file, 'w') as f:
                yaml.dump(vars_dict, f, default_flow_style=False)
            print(f"Variables written to {output_file}")
        except IOError as e:
            raise AnsibleError(f"Erreur lors de l'écriture du fichier {output_file} : {e}")

        return vars_dict

if __name__ == "__main__":
    vm = VarsModule()
    vm.get_vars(None, None, None)