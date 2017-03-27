#!/bin/bash

set -e

# Path to projects.ini and projects.yaml
export PROJECTS_INI=projects.ini
export PROJECTS_YAML=projects.yaml

# Clone jeepyb tool
git clone https://github.com/openstack-infra/jeepyb.git

# Create and activate virtualenv
virtualenv -p python2.7 jeepyb/.jeepyb_venv
source jeepyb/.jeepyb_venv/bin/activate

# Install jeepyb with all necessary dependencies
pip install jeepyb/

# This is temporary part that should be removed after release of gerritlib 0.6.1.
# Update gerritlib manually to match the command for Gerrit-2.12+.
git clone https://github.com/openstack-infra/gerritlib
pip install gerritlib/

echo "Creating projects in Gerrit"
manage-projects -v -d

echo "Cleaning..."
rm -rf gerritlib/ jeepyb/
