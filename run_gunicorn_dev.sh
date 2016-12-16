#!/bin/bash
export PORTALAPI_MODE="dev"
mkdir -p logs
gunicorn -k gevent -w 12 -b 0.0.0.0:7600 portalapi:app \
  --access-logfile logs/gunicorn.dev.access.log \
  --access-logformat '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s" [reqtime: %(L)ss] -- %(U)s -- %(q)s' \
  --error-logfile logs/gunicorn.dev.error.log \
  --log-level info

