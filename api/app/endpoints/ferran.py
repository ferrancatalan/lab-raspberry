from fastapi import APIRouter

router = APIRouter()

@router.get("/")
def get_ferran():
    return {"message": "aa!"}
