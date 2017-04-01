#!/bin/bash

set -e

# Path to projects.ini and projects.yaml
export PROJECTS_INI=projects.ini
export PROJECTS_YAML=projects.yaml

# Clone jeepyb tool
git clone https://github.com/openstack-infra/jeepyb.git

# Create and activate virtualenv
virtualenv -p python2.7 jeepyb_venv
source jeepyb_venv/bin/activate

# Install jeepyb with all necessary dependencies
echo 'setuptools!=34.0.1' >> jeepyb/requirements.txt
pip install -r jeepyb/requirements.txt
pip install jeepyb/
rm -rf jeepyb

# This is temporary part that should be removed after release of gerritlib 0.6.1.
# Update gerritlib manually to match the command for Gerrit-2.12+.
git clone https://github.com/openstack-infra/gerritlib.git
pip install gerritlib/
rm -rf gerritlib

echo "Creating projects in Gerrit"
manage-projects -v -d

rm -rf jeepyb_venv

echo "...Completed..."
