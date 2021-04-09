#!/usr/bin/env bash
source ./admin-var.sh

echo -e "GCP admin project id: ${GCP_PRJ_ID_ADM}"

user_id=`gcloud auth list --filter=status:ACTIVE --format="value(account)"`
echo -e "GCP user id: ${user_id}"

echo -e "GCP terraform bucket region: ${GCP_TF_REGION}"

# for ADM deployments
gcloud services enable --project="${GCP_PRJ_ID_ADM}" cloudbuild.googleapis.com
gsutil mb -p "${GCP_PRJ_ID_ADM}" -c standard -l "${GCP_TF_REGION}" "${GCP_TF_BUCKET_ADM}"
gsutil bucketpolicyonly set on "${GCP_TF_BUCKET_ADM}"
gsutil label ch -l environment:admin "${GCP_TF_BUCKET_ADM}"
gsutil versioning set on "${GCP_TF_BUCKET_ADM}"

# for DEV deployments
gcloud services enable --project="${GCP_PRJ_ID_DEV}" cloudbuild.googleapis.com
gsutil mb -p "${GCP_PRJ_ID_ADM}" -c standard -l "${GCP_TF_REGION}" "${GCP_TF_BUCKET_DEV}"
gsutil bucketpolicyonly set on "${GCP_TF_BUCKET_DEV}"
gsutil label ch -l environment:admin "${GCP_TF_BUCKET_DEV}"
gsutil versioning set on "${GCP_TF_BUCKET_DEV}"

# for TST deployments
gcloud services enable --project="${GCP_PRJ_ID_TST}" cloudbuild.googleapis.com
gsutil mb -p "${GCP_PRJ_ID_ADM}" -c standard -l "${GCP_TF_REGION}" "${GCP_TF_BUCKET_TST}"
gsutil bucketpolicyonly set on "${GCP_TF_BUCKET_TST}"
gsutil label ch -l environment:admin "${GCP_TF_BUCKET_TST}"
gsutil versioning set on "${GCP_TF_BUCKET_TST}"

# for PRD deployments
gcloud services enable --project="${GCP_PRJ_ID_PRD}" cloudbuild.googleapis.com
gsutil mb -p "${GCP_PRJ_ID_ADM}" -c standard -l "${GCP_TF_REGION}" "${GCP_TF_BUCKET_PRD}"
gsutil bucketpolicyonly set on "${GCP_TF_BUCKET_PRD}"
gsutil label ch -l environment:admin "${GCP_TF_BUCKET_PRD}"
gsutil versioning set on "${GCP_TF_BUCKET_PRD}"
