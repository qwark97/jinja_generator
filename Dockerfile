FROM python:3.9.5-slim

WORKDIR /app
VOLUME /app/templates
VOLUME /app/results
ENTRYPOINT [ "/app/docker_entrypoint.sh", "python", "/app/generator.py" ]

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        gosu=1.10-1+b23 && \
    rm -fr /var/lib/apt/lists/* && \
    chown -R 1000:1000 /app && \
    pip install Jinja2==3.0.1

COPY --chown=1000:1000 docker_entrypoint.sh generator.py ./