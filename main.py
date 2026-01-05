"""
FastAPI Application Example
Run with: uvicorn main:app --reload
"""
from fastapi import FastAPI

app = FastAPI(
    title="Python Basic API",
    description="Sample FastAPI application",
    version="1.0.0"
)


@app.get("/")
async def root():
    return {"message": "Hello, World!", "status": "running"}


@app.get("/health")
async def health_check():
    return {"status": "healthy"}


@app.get("/info")
async def info():
    import pandas as pd
    import numpy as np
    return {
        "pandas_version": pd.__version__,
        "numpy_version": np.__version__,
    }
