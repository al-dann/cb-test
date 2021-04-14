#!/usr/bin/env bash
source ./admin-var.sh

echo -e "GCP admin project id: ${GCP_PRJ_ID_ADM}"

user_id=`gcloud auth list --filter=status:ACTIVE --format="value(account)"`
echo -e "GCP user id: ${user_id}"

echo -e "GCP terraform bucket region: ${GCP_TF_REGION}"

# a bucket for terraform state files
gcloud services enable --project="${GCP_PRJ_ID_ADM}" cloudbuild.googleapis.com
gsutil mb -p "${GCP_PRJ_ID_ADM}" -c standard -l "${GCP_TF_REGION}" "${GCP_TF_BUCKET}"
gsutil bucketpolicyonly set on "${GCP_TF_BUCKET}"
gsutil label ch -l environment:admin "${GCP_TF_BUCKET}"
gsutil versioning set on "${GCP_TF_BUCKET}"

