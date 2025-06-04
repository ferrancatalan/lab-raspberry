import json
import gspread
from oauth2client.service_account import ServiceAccountCredentials

def autenticar(ruta_credenciales):
    scope = [
        'https://spreadsheets.google.com/feeds',
        'https://www.googleapis.com/auth/drive'
    ]
    creds = ServiceAccountCredentials.from_json_keyfile_name(ruta_credenciales, scope)
    client = gspread.authorize(creds)
    return client

def procesar_hoja(client, sheet_id):
    hoja = client.open_by_key(sheet_id)
    pestaña = hoja.worksheet("api")
    filas = pestaña.get_all_values()

    datos = {}
    for fila in filas:
        if len(fila) >= 2 and fila[0].strip():
            clave = fila[0].strip()
            valor = fila[1].strip()
            datos[clave] = valor
    return datos
