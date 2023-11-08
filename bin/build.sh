#!/usr/bin/env bash
# exit on error
set -o errexit

# 'compile' sdk using bun
(cd sdk && npm install bun && bun install && bun bundle)

pip install --upgrade pippip install --force-reinstall -U setuptools
pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate
