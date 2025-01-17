FROM python:3.11.4-alpine3.18 AS builder
LABEL maintainer="josso.adrien@gmail.com"

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./app /code/app

EXPOSE 8000

ENTRYPOINT ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "6060"]
# Use CMD to add uvicorn option
