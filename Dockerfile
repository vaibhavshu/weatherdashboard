FROM python:3.7-slim-buster

RUN pip3 install Flask Flask-wtf waitress
RUN mkdir opt/dashboard
COPY . /opt/dashboard
RUN cd /opt/dashboard/ && export FLASK_APP=server && flask init-db

EXPOSE 8080
CMD ["python3", "/opt/dashboard/start.py"]
