from fastapi import FastAPI

app = FastAPI(
    title="DDoS Attack Map API",
    description="Backend API for real-time attack visualization.",
    version="0.1.0",
)


@app.get("/")
async def root():
    return {
        "message": "DDoS Attack Map API is running",
        "status": "online",
    }


@app.get("/health")
async def health():
    return {"status": "healthy"}
