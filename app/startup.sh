#!/bin/bash

touch /tmp/test

sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask

sudo mkdir /var/www

cat <<EOF > /var/www/app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_cloud():
    return 'Hello Cloud!'

app.run(host='0.0.0.0')
EOF

python /var/www/app.py