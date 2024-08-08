FROM python:3.12-alpine

LABEL name="httpbin"
LABEL version="0.9.2"
LABEL description="A simple HTTP service."
LABEL org.opencontainers.image.authors="yasu@yasundial.org"

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apk --no-cache add tzdata bash ca-certificates git make gcc libc-dev linux-headers build-base patch

WORKDIR /httpbin
RUN python3 -m venv venv/httpbin
ADD requirements.txt /httpbin/
RUN . venv/httpbin/bin/activate && pip3 install --no-cache-dir -r requirements.txt

ADD . /httpbin
RUN . venv/httpbin/bin/activate && pip3 install --no-cache-dir /httpbin

EXPOSE 8080

RUN chmod +x run.sh
CMD ["./run.sh"]
