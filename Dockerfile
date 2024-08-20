FROM python:3.11-slim

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip install gunicorn psycopg2-binary

COPY app app
COPY migrations migrations
COPY run.py config.py boot.sh /

ENV FLASK_APP=run.py

EXPOSE 5001
ENTRYPOINT ["./boot.sh"]