## First stage
FROM python:3.12-alpine AS build

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apk --no-cache add tzdata bash ca-certificates git make gcc libc-dev linux-headers build-base patch

WORKDIR /httpbin
RUN python3 -m venv venv/httpbin
ADD requirements.txt /httpbin/
RUN . venv/httpbin/bin/activate && pip3 install --no-cache-dir -r requirements.txt

##################
## Second stage ##
##################
FROM python:3.12-alpine

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apk --no-cache add tzdata bash ca-certificates

LABEL name="httpbin"
LABEL version="0.9.2"
LABEL description="A simple HTTP service."
LABEL org.opencontainers.image.authors="yasu@yasundial.org"

WORKDIR /httpbin
COPY --from=build /httpbin/venv /httpbin/venv

ADD . /httpbin
RUN . venv/httpbin/bin/activate && pip3 install --no-cache-dir /httpbin

EXPOSE 8080

ENV FLASGGER_URL_PREFIX /

RUN chmod +x run.sh
CMD ["./run.sh"]
