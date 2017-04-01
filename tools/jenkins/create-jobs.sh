#!/bin/bash

set -e

JENKINS_JOBS_INI=jenkins_jobs.ini
JENKINS_JOBS_PATH=jobs

# Create and activate virtualenv to install Jenkins Job Builder
virtualenv -p python2.7 jjb_venv
source jjb_venv/bin/activate

pip install jenkins-job-builder

echo "============================================"
echo "Creating Jobs in Jenkins based on data from '${JENKINS_JOBS_PATH}' directory..."
jenkins-jobs --conf ${JENKINS_JOBS_INI} update ${JENKINS_JOBS_PATH}

rm -rf jjb_venv
echo "...Completed..."