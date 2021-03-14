# mongodb-gsutil

## Image

 <https://hub.docker.com/repository/docker/cofacts/mongodb-gsutil>

## Usage

```bash
docker run -it --rm -v `pwd`/key.json:/home/db-backup/key.json \
  --env GCP_PROJECT_ID=<project-id> \
  --env GCS_BUCKET=<bucket> \
  --env MONGOURI=mongodb+srv://<username>:<password>@<host>/<db> \
  cofacts/mongodb-gsutil
```

## Output

```text
$ docker run -it --rm -v `pwd`/key.json:/home/db-backup/key.json \
  --env GCP_PROJECT_ID=cofacts-dev \
  --env GCS_BUCKET=cofacts-db-backup-test \
  --env MONGOURI=mongodb+srv://<username>:<password>@cluster0.xx.mongodb.net/cofacts \
  cofacts/mongodb-gsutil
++ mongodump --uri=mongodb+srv://<username>:<password>@cluster0.xx.mongodb.net/cofacts --out=/home/db-backup/2021-03-14T20:28:00Z
2021-03-14T20:28:05.189+0000 writing cofacts.userArticleLink to /home/db-backup/2021-03-14T20:28:00Z/cofacts/userArticleLink.bson
2021-03-14T20:28:06.290+0000 [........................]  cofacts.userArticleLink  101/244071  (0.0%)
2021-03-14T20:28:06.774+0000 writing cofacts.userArticleLink_20200813_import to /home/db-backup/2021-03-14T20:28:00Z/cofacts/userArticleLink_20200813_import.bson
2021-03-14T20:28:06.774+0000 writing cofacts.userSettings to /home/db-backup/2021-03-14T20:28:00Z/cofacts/userSettings.bson
2021-03-14T20:28:09.282+0000 [........................]                  cofacts.userArticleLink  101/244071  (0.0%)
2021-03-14T20:28:09.282+0000 [........................]  cofacts.userArticleLink_20200813_import  101/244004  (0.0%)
2021-03-14T20:28:09.282+0000 [........................]                     cofacts.userSettings   101/85838  (0.1%)
2021-03-14T20:28:09.282+0000
2021-03-14T20:28:12.282+0000 [........................]                  cofacts.userArticleLink  101/244071  (0.0%)
2021-03-14T20:28:12.282+0000 [........................]  cofacts.userArticleLink_20200813_import  101/244004  (0.0%)
2021-03-14T20:28:12.282+0000 [........................]                     cofacts.userSettings   101/85838  (0.1%)
2021-03-14T20:28:12.282+0000
2021-03-14T20:28:15.282+0000 [........................]                  cofacts.userArticleLink  101/244071  (0.0%)
2021-03-14T20:28:15.282+0000 [........................]  cofacts.userArticleLink_20200813_import  101/244004  (0.0%)
2021-03-14T20:28:15.282+0000 [........................]                     cofacts.userSettings   101/85838  (0.1%)
2021-03-14T20:28:15.282+0000
2021-03-14T20:28:18.282+0000 [###########.............]                  cofacts.userArticleLink  112625/244071  (46.1%)
2021-03-14T20:28:18.282+0000 [........................]  cofacts.userArticleLink_20200813_import     101/244004   (0.0%)
2021-03-14T20:28:18.282+0000 [........................]                     cofacts.userSettings      101/85838   (0.1%)
2021-03-14T20:28:18.283+0000
2021-03-14T20:28:21.248+0000 [###########.............]                  cofacts.userArticleLink  112625/244071  (46.1%)
2021-03-14T20:28:21.248+0000 [###########.............]  cofacts.userArticleLink_20200813_import  112625/244004  (46.2%)
2021-03-14T20:28:21.248+0000 [........................]                     cofacts.userSettings      101/85838   (0.1%)
2021-03-14T20:28:21.248+0000
2021-03-14T20:28:22.340+0000 [########################]  cofacts.userSettings  85838/85838  (100.0%)
2021-03-14T20:28:22.340+0000 done dumping cofacts.userSettings (85838 documents)
2021-03-14T20:28:24.248+0000 [###########.............]                  cofacts.userArticleLink  112625/244071  (46.1%)
2021-03-14T20:28:24.248+0000 [###########.............]  cofacts.userArticleLink_20200813_import  112625/244004  (46.2%)
2021-03-14T20:28:24.248+0000
2021-03-14T20:28:26.445+0000 [########################]  cofacts.userArticleLink  244071/244071  (100.0%)
2021-03-14T20:28:26.445+0000 done dumping cofacts.userArticleLink (244071 documents)
2021-03-14T20:28:27.248+0000 [###########.............]  cofacts.userArticleLink_20200813_import  112625/244004  (46.2%)
2021-03-14T20:28:30.248+0000 [######################..]  cofacts.userArticleLink_20200813_import  226457/244004  (92.8%)
2021-03-14T20:28:31.722+0000 [########################]  cofacts.userArticleLink_20200813_import  244004/244004  (100.0%)
2021-03-14T20:28:31.722+0000 done dumping cofacts.userArticleLink_20200813_import (244004 documents)
++ gcloud auth activate-service-account --key-file /home/db-backup/key.json
Activated service account credentials for: [69418316315-compute@developer.gserviceaccount.com]
++ gcloud config set project cofacts-dev
Updated property [core/project].
++ gsutil cp -r /home/db-backup/2021-03-14T20:28:00Z gs://cofacts-db-backup-test/2021-03-14T20:28:00Z
Copying file:///home/db-backup/2021-03-14T20:28:00Z/cofacts/userArticleLink.metadata.json [Content-Type=application/json]...
Copying file:///home/db-backup/2021-03-14T20:28:00Z/cofacts/userArticleLink_20200813_import.bson [Content-Type=application/octet-stream]...
Copying file:///home/db-backup/2021-03-14T20:28:00Z/cofacts/userSettings.metadata.json [Content-Type=application/json]...
Copying file:///home/db-backup/2021-03-14T20:28:00Z/cofacts/userArticleLink_20200813_import.metadata.json [Content-Type=application/json]...
| [4 files][ 32.8 MiB/ 32.8 MiB]    1.4 MiB/s
==> NOTE: You are performing a sequence of gsutil operations that may
run significantly faster if you instead use gsutil -m cp ... Please
see the -m section under "gsutil help options" for further information
about when gsutil -m can be advantageous.

Copying file:///home/db-backup/2021-03-14T20:28:00Z/cofacts/userArticleLink.bson [Content-Type=application/octet-stream]...
Copying file:///home/db-backup/2021-03-14T20:28:00Z/cofacts/userSettings.bson [Content-Type=application/octet-stream]...
- [6 files][ 74.6 MiB/ 74.6 MiB]    2.1 MiB/s
Operation completed over 6 objects/74.6 MiB.
```
