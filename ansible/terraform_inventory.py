#!/usr/bin/env python3

import json
import subprocess

def get_tf_outputs():
    result = subprocess.run(["terraform", "output", "-json"], capture_output=True, text=True)
    return json.loads(result.stdout)

def generate_inventory():
    tf_outputs = get_tf_outputs()
    
    inventory = {
        "all": {
            "children": {
                "acr": {
                    "hosts": {
                        "acr-server": {
                            "ansible_host": tf_outputs["acr_login_server"]["value"]
                        }
                    }
                },
                "vm": {
                    "hosts": {
                        "vm-server": {
                            "ansible_host": tf_outputs["vm_public_ip_addresses"]["value"][0],
                            "ansible_user": "adminuser",
                            "ansible_ssh_private_key_file": "/tmp/terraform_vm_key.pem"
                        }
                    }
                },
                "aks": {
                    "hosts": {
                        "aks-server": {
                            "ansible_host": tf_outputs["aks_cluster_name"]["value"]
                        }
                    }
                }
            }
        }
    }
    print(json.dumps(inventory, indent=2))

if __name__ == "__main__":
    generate_inventory()
