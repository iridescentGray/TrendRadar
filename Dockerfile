FROM python:3.12-slim-bookworm as base

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN mkdir /trendradar

# RUN mkdir /trendradar/config

WORKDIR /trendradar

FROM base as runtime-image

COPY requirements.txt /trendradar/

# COPY config /trendradar

RUN apt-get update  \
    &&  pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt 


# CMD python main.py

COPY . /trendradar/
