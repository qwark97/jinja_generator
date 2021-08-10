#!/bin/bash

CMD=$*

chown -R 1000:1000 /app

exec gosu 1000:1000 $CMD