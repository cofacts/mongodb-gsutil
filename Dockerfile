FROM mongo:4.2

# Install gcloud command
RUN apt-get update
RUN apt-get install -y curl apt-transport-https ca-certificates gnupg
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update && apt-get install google-cloud-sdk -y
COPY run.sh /home/db-backup/run.sh

ENV MONGOURI="mongodb://host.docker.internal:27017"
ENV GCP_PROJECT_ID="cofacts-dev"
ENV GCS_BUCKET="cofacts-db-backup-test"

ENTRYPOINT bash -c /home/db-backup/run.sh