# OpenShift Notes
Compiled information for devops/sysads supporting RedHat OpenShift Platform.

## Contents
* [deploying-apps-from-sourcecode.sh](deploying-apps-from-sourcecode.sh): Creation of application with sourcecode such as a GitRepo.
* [transfer-files.sh](transfer-files.sh): Transfer files between containers and the local machine.
* [disk-pressure-fix.sh](disk-pressure-fix.sh): Fix for a specific node's disk pressure.
* [okd-4.6-efs-provisioner-error-fix.yaml](okd-4.6-efs-provisioner-error-fix.yaml): Fix for _EFS Provisionner Error_ on OKD 4.6 (as of this commit).
* [host-aliases.yaml](host-aliases.yaml): To resolve hosts when dns is failing.
* [podcounter.sh](podcounter.sh): Counts number of pods hosted on all the nodes. Usage: `bash podcounter.sh`