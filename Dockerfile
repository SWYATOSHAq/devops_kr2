FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN useradd --create-home appuser
COPY app.py .

USER appuser
EXPOSE 8004
CMD ["gunicorn", "--bind", "0.0.0.0:8004", "app:app"]
