#!/bin/bash

test -f venv/httpbin/bin/activate && . venv/httpbin/bin/activate
exec gunicorn -b 0.0.0.0:8080 httpbin:app -k gevent

