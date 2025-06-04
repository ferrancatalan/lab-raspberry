from fastapi import APIRouter, HTTPException
from fastapi.responses import JSONResponse
from app.services.reader import cargar_varios_json

router = APIRouter()

@router.get("/")
def get_dashboard():
    archivos = ["cuentas.json", "piso.json", "prestamo.json"]
    return cargar_varios_json(archivos)