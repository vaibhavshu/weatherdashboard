FROM python:3.7-slim-buster

RUN echo '[INFO] Installing Dependencies.'
RUN pip3 install Flask Flask-wtf waitress
RUN echo '[INFO] Installation Done.'

ADD master/ /opt/master
RUN cd /opt/master/ && export FLASK_APP=server && flask init-db && python3 start.py

EXPOSE 8080
