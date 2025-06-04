import os
import yaml
import json

from process_data import autenticar, procesar_hoja


home_dir = os.path.expanduser("~") 
config_path = os.path.join(home_dir, "lab/apps/leer-google-calc/config.yaml")

# Cargar configuración
with open(config_path, "r") as f:
    config = yaml.safe_load(f)

# Autenticarse con Google
client = autenticar(f"{home_dir}/{config['google']['service_account_file']}")

# Procesar cada hoja
for hoja in config['sheets']:
    datos = procesar_hoja(client, hoja['id'])
    ruta_salida = f"{home_dir}/lab/data/leer-google-calc/{hoja['nombre']}.json"
    os.makedirs(os.path.dirname(ruta_salida), exist_ok=True)
    with open(ruta_salida, "w", encoding="utf-8") as f:
        json.dump(datos, f, ensure_ascii=False, indent=2)
