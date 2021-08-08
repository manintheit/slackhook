FROM registry.access.redhat.com/ubi8/python-39:1-10.1626843749
ARG SLACK_URL
ARG PROXY
ENV SLACK_URL=${SLACK_URL}
ENV PROXY=${PROXY}

LABEL io.k8s.description "Sample Slack Hook with Python" \
      version "1.0"

COPY src/ ${HOME}
RUN pip install requests --no-cache-dir
WORKDIR ${HOME}
CMD ["./entrypoint.sh"]



