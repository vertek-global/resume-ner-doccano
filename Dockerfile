FROM doccano/doccano:latest
ENTRYPOINT ["gunicorn", "backend.app:app", "-b", "0.0.0.0:8000", "-k", "uvicorn.workers.UvicornWorker"]
