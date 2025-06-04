import os
import json

home_dir = os.path.expanduser("~") 
BASE_DIR = os.path.join(home_dir, "lab/data/leer-google-calc/")

def listar_jsons():
    if not os.path.exists(BASE_DIR):
        raise HTTPException(status_code=404, detail="Directorio no encontrado.")
    return [f for f in os.listdir(BASE_DIR) if f.endswith(".json")]

def cargar_json(nombre_archivo):
    ruta = os.path.join(BASE_DIR, nombre_archivo)
    print("Llamada al endpoint /dashboard")
    if not os.path.exists(ruta):
        raise HTTPException(status_code=404, detail="Archivo no encontrado.")
    with open(ruta, "r", encoding="utf-8") as f:
        return json.load(f)
    
def cargar_varios_json(nombres_archivos):
    resultado = {}
    for nombre in nombres_archivos:
        clave = os.path.splitext(nombre)[0]  # Quita extensión .json para usar como clave
        resultado[clave] = cargar_json(nombre)
    return resultado
