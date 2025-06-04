from fastapi import FastAPI
from app.endpoints import dashboard,ferran

app = FastAPI(
    title="API de raspberry",
    description="Esta API devuelve datos exportados desde hojas de cálculo de Google en formato JSON.",
    version="1.0.0",
    docs_url="/docs",
    redoc_url="/redoc",
    openapi_url="/openapi.json",
)

# Rutas
app.include_router(dashboard.router, prefix="/dashboard", tags=["Dashboard"])
app.include_router(ferran.router, prefix="/ferran", tags=["Ferran"])
