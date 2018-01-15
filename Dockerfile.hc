FROM python:2.7
COPY requirements.txt gunicorn.conf hc_app.py hc_config.py /
COPY celery_app_config.py.example /celery_app_config.py
RUN pip install -r requirements.txt && \
    mkdir /instance && \
    touch /instance/hc_config.py
EXPOSE 8000
ENTRYPOINT ["/usr/local/bin/gunicorn", "--config", "/gunicorn.conf", "-b", ":8000", "hc_app:app"]