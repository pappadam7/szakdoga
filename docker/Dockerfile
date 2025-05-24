FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y git postgresql-client netcat-openbsd && apt-get clean

WORKDIR /app

ARG GIT_REPO
ARG PROJECT_NAME

RUN git clone ${GIT_REPO} ${PROJECT_NAME}

WORKDIR /app/${PROJECT_NAME}

COPY wait-for-it.sh /app/wait-for-it.sh
RUN chmod +x /app/wait-for-it.sh

COPY adatbazis_dump.sql /app/${PROJECT_NAME}/data.sql
COPY entrypoint.sh /app/${PROJECT_NAME}/entrypoint.sh

RUN pip install --upgrade pip && pip install -r requirements.txt

# futtathatóvá tesszük a scripet
RUN chmod +x entrypoint.sh

CMD ["./entrypoint.sh"]
