# from docker env
: ${GCP_PROJECT_ID="cofacts-dev"}
: ${GCS_BUCKET="cofacts-db-backup-test"}
: ${MONGOURI="mongodb://host.docker.internal:27017"}

# default env
: ${MONGODUMP_DIR="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"}
: ${MONGODUMP_OUT="/home/db-backup/$MONGODUMP_DIR"}
: ${KEY_PATH="/home/db-backup/key.json"}
: ${GCS_PATH="gs://$GCS_BUCKET/$MONGODUMP_DIR"}

set -x
mongodump --uri=$MONGOURI --out=$MONGODUMP_OUT
gcloud auth activate-service-account --key-file ${KEY_PATH}
gcloud config set project $GCP_PROJECT_ID
gsutil cp -r $MONGODUMP_OUT $GCS_PATH
