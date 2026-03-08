FROM python:3.9-slim-bullseye

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install Flask
RUN pip install Flask-SQLAlchemy

ENV FLASK_APP=app.py
ENV FLASK_DEBUG=0

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]
