FROM python:3.9.14-alpine3.16
USER root
COPY . /testing
RUN apk update && pip install --upgrade pip && apk add postgresql-dev gcc g++ python3-dev musl-dev && pip install -r requirements.txt
WORKDIR /testing/
EXPOSE 1234
ENTRYPOINT ["python", "-m", "flask", "run", "--host=0.0.0.0"]