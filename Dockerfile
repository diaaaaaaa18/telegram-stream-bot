FROM python:3.11-slim

WORKDIR /app

COPY telegram_stream_bot_v2.zip /tmp/project.zip

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip \
    && unzip -q /tmp/project.zip -d /tmp/project \
    && cp -a /tmp/project/telegram_stream_bot_v2/. /app/ \
    && rm -rf /tmp/project /tmp/project.zip \
    && pip install --no-cache-dir -r requirements.txt

CMD ["python", "-m", "app.main"]
