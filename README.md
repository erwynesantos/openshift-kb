# OpenShift KB
Compiled knowledge base and scripts for devops/sysads supporting RedHat OpenShift Platform.

## Contents
* [dep-from-src.yml](dep-from-src.yml): Creation of application with sourcecode such as a GitRepo.
* [dep-from-docker-img.yml](dep-from-docker-img.yml): Creation of application using a docker image.
* [add-routes.yml](add-routes.yml): Add routes to the created application.
* [transfer-files.sh](transfer-files.sh): Transfer files between containers and the local machine.
* [disk-pressure-fix.sh](disk-pressure-fix.sh): Fix for a specific node's disk pressure.
* [okd-4.6-efs-provisioner-error-fix.yml](okd-4.6-efs-provisioner-error-fix.yml): Fix for _EFS Provisionner Error_ on OKD 4.6 (as of this commit).
* [host-aliases.yml](host-aliases.yml): To resolve hosts when dns is failing.
* [podcounter.sh](podcounter.sh): Counts the number of pods hosted on all the nodes. Usage: `bash podcounter.sh`.
* [efs-provisioner-default](efs-provisioner-default): All required yaml files for creating an EFS Provisioner.
* [pod-admin.yaml](pod-admin.yaml): Template for creating a _pod-admin cluster role_.

### Contributors
L2 Platform / SysAd
