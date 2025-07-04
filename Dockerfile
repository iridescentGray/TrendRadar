FROM python:3.12-slim-bookworm as base

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN mkdir /trendradar

WORKDIR /trendradar

FROM base as runtime-image

COPY requirements.txt /trendradar/

RUN apt-get update  \
    &&  pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt 


COPY . /trendradar/
